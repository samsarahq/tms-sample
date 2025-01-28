# == Schema Information
#
# Table name: events
#
#  id                :integer          not null, primary key
#  event_type        :string
#  payload           :json
#  processing_errors :text
#  source            :string
#  status            :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  event_id          :string
#
class Event < ApplicationRecord
end
