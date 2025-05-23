# == Schema Information
#
# Table name: webhook_events
#
#  id                :bigint           not null, primary key
#  event_type        :string
#  payload           :json             not null
#  processing_errors :text
#  source            :string           not null
#  status            :integer          default("pending"), not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class WebhookEvent < ApplicationRecord
  enum :status, { pending: 0, processed: 1, failed: 2 }
end
