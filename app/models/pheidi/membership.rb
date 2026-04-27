module Pheidi
  class Membership < ApplicationRecord
    belongs_to :conversation, class_name: "Pheidi::Conversation"
    
    belongs_to :participant, polymorphic: true

    validates :participant_id, presence: true
    validates :participant_type, presence: true
    
    validates :role, presence: true
  end
end
