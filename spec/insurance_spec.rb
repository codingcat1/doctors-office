require 'spec_helper'

describe Insurance do
  it 'will initialize with a name' do
    bluecross = Insurance.new({:name => 'bluecross', :id => 1})
    expect(bluecross.attributes).to eq ({:name => 'bluecross', :id => 1})
  end
  it 'will save insurance to the database' do
    redsnake = Insurance.new({:name => 'redsnake', :id => 1})
    redsnake.save
    expect(Insurance.all).to eq [redsnake]
  end
end
