require 'spec_helper'

describe Insurance do
  it 'will initialize with a name' do
    bluecross = Insurance.new({:name => 'bluecross'})
    expect(bluecross.attributes).to eq({:name => 'bluecross'})
  end
  it 'will save insurance to the database' do
    redsnake = Insurance.new({:name => 'redsnake'})
    redsnake.save
    expect(Insurance.all).to eq [redsnake]
  end
end
