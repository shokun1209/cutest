class Message < ApplicationRecord
  belongs_to :photos, optional: true
  
  with_options presence: true do
    validates :name
    validates :text
  end
end
