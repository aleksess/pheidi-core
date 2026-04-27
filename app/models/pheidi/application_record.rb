module Pheidi
  class ApplicationRecord < ActiveRecord::Base
    self.abstract_class = true


    def self.resolve_connection
      env = Rails.env
      config_name = "pheidi_#{env}"
      
      if Rails.configuration.database_configuration.key?(config_name)
        connects_to database: { writing: :pheidi, reading: :pheidi }
      else
        # Fallback dla dewelopera, który jeszcze nie odpalił generatora
        self.connection_specification_name = "primary"
      end
    end

    resolve_connection
  end
end
