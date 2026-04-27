module Pheidi
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("templates", __dir__)

      desc "Configures Pheidi for your application (Multi-DB setup)"

      def copy_initializer
        template "pheidi_initializer.rb", "config/initializers/pheidi.rb"
      end

      def copy_migrations
        destination = "db/pheidi_migrate" 

        template "migrations/create_pheidi_tables.rb", "#{destination}/01_create_pheidi_tables.rb"
      end

      def inject_database_config
        inject_into_file "config/database.yml", after: "development:\n" do
          <<-YAML
  pheidi:
    <<: *default
    database: storage/pheidi_development.sqlite3
    migrations_paths: db/pheidi_migrate
          YAML
        end
      end

    end
  end
end
