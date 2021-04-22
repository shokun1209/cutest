require 'line/bot'

class WebhookController < ApplicationController
  before_action :set_line_client
  protect_from_forgery :except => [:callback]
  
  CHANNEL_SECRET = ENV['CHANNEL_SECRET']
  CHANNEL_ACCESS_TOKEN = ENV['CHANNEL_ACCESS_TOKEN']
  
  def callback
    body = request.body.read
    
    unless @client.validate_signature(body, request.env['HTTP_X_LINE_SIGNATURE'])
      error 400 do 'Bad Request' end
      end
      
      event = @client.parse_events_from(body)[0]
      message = { text: nil }
      
      case event.type
        # 画像か動画なら登録する
      when "image", "video"
        temp = Tempfile.new("example").binmode.tap do |file|
          file.write @client.get_message_content(event.message['id']).body
        end
        if Photo.create(image: temp, uploader_id: find_or_create_uploader.id, photo_date: Time.zone.today, content_type: event.type)
          type_str = event.type == "image" ? "画像" : "動画"
          message = { type: 'text', text: "#{type_str}を登録しました！" }
        end
      end
      
      # Botを介してLineへメッセージ送信
      if message[:text].present?
        @client.reply_message(event['replyToken'], message)
      end
      
      # webからは何も返さない
      render :nothing => true, status: :ok
    end
    
    private
    
    # メッセージを取扱いやすくしてくれるclientをセット
    def set_line_client
      @client ||= Line::Bot::Client.new { |config|
        config.channel_secret = CHANNEL_SECRET
        config.channel_token = CHANNEL_ACCESS_TOKEN
      }
    end
    
    # Uploaderを見つけるor登録する
    def find_or_create_uploader
      line_id = params[:events][0][:source][:userId]
      uploader = Uploader.find_by(line_id: line_id)
      unless uploader
        uploader = Uploader.create(line_id: line_id, token: SecureRandom.uuid, name: line_name(line_id))
      end
      uploader
    end
    
    # プロフィールからLineの名前を取ってくる
    def line_name(line_id)
      response = @client.get_profile(line_id)
      case response
      when Net::HTTPSuccess then
        return JSON.parse(response.body)['displayName']
      end
    end
  end