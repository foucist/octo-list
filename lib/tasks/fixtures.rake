
# This code courtesy of the "Rails Recipe's book":http://www.pragmaticprogrammer.com/titles/fr_rr/ I believe. 
namespace :db do
  namespace :fixtures do

    desc 'Create YAML test fixtures from data in an existing database. Defaults to development database. Set RAILS_ENV to override.'
    task :dump => :environment do
      # Remove the limit if you want to. It's a timesaver mostly
      sql  = "SELECT * FROM %s LIMIT 0,1000" 
      # Add tables you don't want dumped. 
      skip_tables = ["schema_info", "plugin_schema_info", "engine_schema_info", "sessions"]
      ActiveRecord::Base.establish_connection(:development)
      (ActiveRecord::Base.connection.tables - skip_tables).each do |table_name|
        i = "000" 
        File.open("#{RAILS_ROOT}/test/fixtures/#{table_name}.yml", 'w') do |file|
          data = ActiveRecord::Base.connection.select_all(sql % table_name)
          file.write data.inject({}) { |hash, record|
            hash["#{table_name}_#{i.succ!}"] = record
            hash
          }.to_yaml
        end
      end
    end
  end
end
