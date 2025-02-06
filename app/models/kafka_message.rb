# == Schema Information
#
# Table name: kafka_messages
#
#  id                :bigint           not null, primary key
#  key               :string
#  payload           :json
#  processing_errors :text             default("")
#  topic             :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class KafkaMessage < ApplicationRecord
end
