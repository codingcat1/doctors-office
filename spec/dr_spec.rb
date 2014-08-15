require 'spec_helper'

describe Dr do
  it 'will initialize with a name, specialty id, and insurance id' do
    Dr_jung = Dr.new({:name => "jung", :specialty_id => 3, :insurance_id => 2})
    expect(Dr_jung.attributes).to eq ({:name => "jung", :specialty_id => 3, :insurance_id => 2})
  end

  it 'lets you save dr names to the database' do
    Dr_jung = Dr.new({:name => "jung", :specialty_id => 3, :insurance_id => 2})
    Dr_jung.save
    expect(Dr.all).to eq [Dr_jung]
  end
end
