# == Schema Information
#
# Table name: vehicles
#
#  id         :bigint           not null, primary key
#  latitude   :float
#  longitude  :float
#  make       :string
#  model      :string
#  name       :string
#  notes      :text
#  vin        :string
#  year       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  samsara_id :string
#  user_id    :integer          not null
#
# Indexes
#
#  index_vehicles_on_samsara_id  (samsara_id) UNIQUE
#  index_vehicles_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Vehicle < ApplicationRecord
  belongs_to :user
end
