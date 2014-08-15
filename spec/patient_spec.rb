require 'spec_helper'

describe Patient do
  it "initializes patient with name, birthday, medical conditions, and dr id" do
    bob = Patient.new({:name => "Bob", :birthday => "4/20/1954", :dr_id => 4, :id => 1})
    expect(bob).to be_an_instance_of(Patient)
  end

  it "saves the patient data to the dataBASE" do
    fred = Patient.new({:name => "Fred", :birthday => "5/12/1584", :dr_id => 4, :id => 1})
    fred.save
    expect(Patient.all).to eq [fred]
  end
end
