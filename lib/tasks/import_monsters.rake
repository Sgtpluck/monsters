namespace :import_monsters do

desc 'Import CSV data'
task :create_monsters => :environment do
  require 'csv'

  CSV.foreach('db/monsters.csv') do |row|

    m = Monster.create!({
        name: row[0],
        cr: row[1].to_f,
        type: row[2],
        environment: row[3],
        visual_desc: row[4],
        description: row[5]
      }
    )
    end

  end

end