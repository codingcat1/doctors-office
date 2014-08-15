require 'spec_helper'
require 'specialty'

describe Specialty do
  it "will initialize with a name" do
    neuro = Specialty.new({:name => 'neuro', :id => 1})
    expect(neuro.attributes).to eq ({:name => 'neuro', :id => 1})
  end

  it "will save the specialty data to the database" do
    neuro = Specialty.new({:name => 'neuro', :id => 1})
    neuro.save
    expect(Specialty.all).to eq [neuro]
  end
end
