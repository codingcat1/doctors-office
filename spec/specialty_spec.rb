require 'spec_helper'
require 'specialty'

describe Specialty do
  it "will initialize with a name" do
    neuro = Specialty.new({:name => 'neuro'})
    expect(neuro.attributes).to eq ({:name => 'neuro'})
  end
end
