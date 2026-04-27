module Pheidi
  module Participant
    extend ActiveSupport::Concern

    included do
      has_many :pheidi_memberships, 
               as: :participant, 
               class_name: "Pheidi::Membership", 
               dependent: :destroy

      has_many :pheidi_conversations, 
               through: :pheidi_memberships, 
               source: :conversation

      has_many :pheidi_sent_messages, 
               as: :sender, 
               class_name: "Pheidi::Message", 
               dependent: :destroy
    end

    # Pomocnik, który przyda się przy widokach
    def pheidi_display_name
      respond_to?(:name) ? name : "User ##{id}"
    end
  end
end
