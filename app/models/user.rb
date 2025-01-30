# == Schema Information
#
# Table name: users
#
#  id                  :integer          not null, primary key
#  email_address       :string           not null
#  password_digest     :string           not null
#  samsara_credentials :json             not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
# Indexes
#
#  index_users_on_email_address  (email_address) UNIQUE
#
class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :locations, dependent: :destroy
  has_many :drivers, dependent: :destroy
  has_many :vehicles, dependent: :destroy
  has_many :routes, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :trailers, dependent: :destroy

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  validates :email_address, presence: true, uniqueness: true
end
