class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  validates :body, length: { minimum: 40 }
  validates :description, length: { minimum: 150 }, allow_blank: true
end
