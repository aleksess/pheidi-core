module Pheidi
  class Conversation < ApplicationRecord
    has_many :memberships, class_name: "Pheidi::Membership", dependent: :destroy
    has_many :messages, class_name: "Pheidi::Message", dependent: :destroy
    
    has_many :participants, through: :memberships

    validates :slug, presence: true, uniqueness: true

    before_validation :generate_slug, on: :create

    private

    def generate_slug
      self.slug ||= SecureRandom.hex(8)
    end
  end
end
