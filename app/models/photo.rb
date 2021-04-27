class Photo < ActiveRecord::Base
  
  mount_uploader :image, ImageUploader
  belongs_to :uploader,optional: true
  has_many :messages,  dependent: :destroy
    
  def upload_dir
    self.photo_date.strftime("%Y年 %m月 %d日")
  end
end