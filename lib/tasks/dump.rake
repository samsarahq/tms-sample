namespace :dump do
  task db: :environment do
    if !Rails.env.development?
      raise "This task is only available in development environment"
    end

    puts "Removing potential existing backups..."
    if File.directory?("/tmp/backups")
      FileUtils.rm_rf("/tmp/backups")
    end

    puts "Creating a folder to handle backups"
    FileUtils.mkdir_p("/tmp/backups")
    Dir.chdir("/tmp/backups")

    puts "Backuping remote Render db..."
    system("pg_dump -d #{Rails.application.credentials.prod_db_connection_string} > dump.sql")

    puts "Dropping local db..."
    system("dropdb mini_tms_development")

    puts "Recreating local db..."
    system("createdb mini_tms_development")

    puts "Restoring local db..."
    system("psql -d mini_tms_development -f dump.sql")
  end
end
