# == Schema Information
#
# Table name: locations
#
#  id                :bigint           not null, primary key
#  formatted_address :string
#  geofence          :json
#  latitude          :float
#  longitude         :float
#  name              :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  samsara_id        :string
#  user_id           :integer          not null
#
# Indexes
#
#  index_locations_on_samsara_id  (samsara_id) UNIQUE
#  index_locations_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Location < ApplicationRecord
  belongs_to :user
  has_many :stops, dependent: :destroy

  validates :name, :formatted_address, presence: true
end
