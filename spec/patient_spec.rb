require 'spec_helper'

describe Patient do
  it "initializes patient with name, birthday, and embarrassing medical problems" do
    bob = Patient.new({:name => "Bob", :birthday => "4/20/1954", :condition => "sentient lice", :dr_id => 4})
    expect(bob).to be_an_instance_of(Patient)
  end

  it "saves the patient data to the dataBASE" do
    Fred = Patient.new({:name => "Fred", :birthday => "5/12/1584", :condition => "chronic robot-itis", :dr_id => 4})
    Fred.save
    expect(Patient.all).to eq [Fred]
  end
end
