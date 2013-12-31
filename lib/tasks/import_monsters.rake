namespace :import_monsters do

desc 'Import CSV data'
task :create_monsters => :environment do
  require 'csv'

  CSV.foreach('db/monsters.csv') do |row|

    m = Monster.create!({
        name: row[0],
        cr: row[1].to_f,
        type: row[2].titleize,
        environment: row[3].titleize,
        visual_desc: row[4],
        description: row[5],
        exp: row[6]
      }
    )
    end

  end

end