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
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
