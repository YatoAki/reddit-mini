class Post < ApplicationRecord
  belongs_to :author,
   class_name: :User,
   foreign_key: :user_id,
   primary_key: :id
  belongs_to :sub

  validates :title, presence: true
  validates :content, presence: true
end
