class NotificationRequest < ApplicationRecord
  validates :email, presence: true
  validates :query, presence: true
end
