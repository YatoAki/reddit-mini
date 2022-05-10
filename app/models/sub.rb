class Sub < ApplicationRecord

  validates :name, presence: true
  validates :detail, presence: true, length: {minimum: 10}

  belongs_to :moderator,
   class_name: :User,
   foreign_key: :user_id,
   primary_key: :id
end
