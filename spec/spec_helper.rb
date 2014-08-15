require 'rspec'
require 'dr'
require 'pg'
require 'patient'
require 'insurance'
require 'specialty'

DB = PG.connect({:dbname => 'dr_office_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM dr *;")
    DB.exec("DELETE FROM patients *;")
    DB.exec("DELETE FROM insurance *;")
    DB.exec("DELETE FROM specialty *;")
  end
end
