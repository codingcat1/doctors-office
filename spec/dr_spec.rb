require 'spec_helper'

describe Dr do
  it 'will initialize with a name and specialty' do
    Dr_jung = Dr.new({:name => "jung", :specialty => "dreams"})
    expect(Dr_jung.attributes).to eq ({:name => "jung", :specialty => "dreams"})
  end

  it 'lets you save dr names to the database' do
    Dr_jung = Dr.new({:name => "jung", :specialty => "dreams"})
    Dr_jung.save
    expect(Dr.all).to eq [Dr_jung]
  end
end
