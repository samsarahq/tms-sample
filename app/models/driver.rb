# == Schema Information
#
# Table name: drivers
#
#  id           :integer          not null, primary key
#  name         :string
#  username     :string
#  password     :string
#  samsara_id   :string
#  phone_number :string
#  status       :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Driver < ApplicationRecord
  validates :name, :username, :password, :phone_number, presence: true

  enum :status, { active: 0, deactivated: 1 }
end
