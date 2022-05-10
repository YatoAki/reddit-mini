class Sub < ApplicationRecord

  validates :name, presence: true
  validates :detail, presence: true, length: {minimum: 10}
end
