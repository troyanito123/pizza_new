class Report < ApplicationRecord

  scope :state, ->(state) { where("state = ?", state) }
  scope :on, ->{ where("state = ?", true) }
  scope :daily, ->{ where("prevalence = ?", 'daily') }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: {minimum: 2,maximum: 250},
            format: {with: VALID_EMAIL_REGEX}
  validates :day, presence: true
end
