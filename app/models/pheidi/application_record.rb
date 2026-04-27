module Pheidi
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true

    connects_to database: { writing: Pheidi.configuration.database, reading: Pheidi.configuration.database }

    before_create :generate_uuid
    private

    def generate_uuid
      self.id ||= SecureRandom.uuid
    end
  end
end
