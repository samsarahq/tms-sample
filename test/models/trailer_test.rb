# == Schema Information
#
# Table name: trailers
#
#  id            :integer          not null, primary key
#  license_plate :string
#  make          :string
#  model         :string
#  name          :string
#  notes         :text
#  vin           :string
#  year          :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  samsara_id    :string
#  user_id       :integer          not null
#
# Indexes
#
#  index_trailers_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require "test_helper"

class TrailerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
