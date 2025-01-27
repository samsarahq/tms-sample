# == Schema Information
#
# Table name: drivers
#
#  id           :integer          not null, primary key
#  name         :string
#  password     :string
#  phone_number :string
#  status       :integer
#  username     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  samsara_id   :string
#  user_id      :integer
#
# Indexes
#
#  index_drivers_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#

class Driver < ApplicationRecord
  belongs_to :user

  validates :name, :username, :password, :phone_number, presence: true

  phony_normalize :phone_number, as: :phone_number_normalized_version, default_country_code: 'US'

  enum :status, { active: 0, deactivated: 1 }

  def hos
    @hos ||= Samsara::Client.new(user).driver_clocks(samsara_id)[0]
  end

  def clocks
    @clocks ||= hos.fetch("clocks", {})
  end
end
