require 'rspec'
require 'Dr'
require 'pg'

DB = PG.connect({:dbname => 'dr_office'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM dr *;")
  end
end

describe Dr do
  it 'will initialize with a name and id' do
    Dr_jung = Dr.new({:name => "jung"})
    expect(Dr_jung.attributes).to eq ({:name => "jung"})
  end

  it 'lets you save dr names to the database' do
    Dr_jung = Dr.new({:name => "jung"})
    Dr_jung.save
    expect(Dr.all).to eq [Dr_jung]
  end
end
