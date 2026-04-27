module Pheidi
  class Message < ApplicationRecord
    belongs_to :conversation, class_name: "Pheidi::Conversation"
    
    belongs_to :sender, polymorphic: true

    validates :body, presence: true
    validates :sender_id, presence: true
    validates :sender_type, presence: true

    scope :ordered, -> { order(created_at: :asc) }
  end
end
