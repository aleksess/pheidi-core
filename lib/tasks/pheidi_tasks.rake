# desc "Explaining what the task does"
# task :pheidi do
#   # Task goes here
# end
#
namespace :pheidi do
  namespace :db do
    desc "Migrate the Pheidi-specific database"
    task migrate: :environment do
      ActiveRecord::Base.establish_connection :pheidi_development
      ActiveRecord::MigrationContext.new("db/pheidi_migrate", ActiveRecord::SchemaMigration).migrate
      say "Pheidi database migrated successfully!", :green
    end
  end
end
