require 'spec_helper'
require 'specialty'

describe Specialty do
  it "will initialize with a name" do
    neuro = Specialty.new({:name => 'neuro'})
    expect(neuro.attributes).to eq ({:name => 'neuro'})
  end

  it "will save the specialty data to the database" do
    neuro = Specialty.new({:name => 'neuro'})
    neuro.save
    expect(Specialty.all).to eq [neuro]
  end
end
