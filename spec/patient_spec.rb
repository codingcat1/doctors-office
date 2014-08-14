require 'rspec'
require 'pg'
require 'patient'

describe Patient do
  it "initializes patient with name, birthday, and embarrassing medical problems" do
    bob = Patient.new({:name => "Bob", :birthday => "4/20/1954", :condition => "sentient lice"})
    expect(bob).to be_an_instance_of(Patient)
  end
end
