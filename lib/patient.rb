require 'pg'

class Patient
  attr_reader(:name, :birthday, :condition, :dr_id)

  def initialize(attributes)
    @name = attributes[:name]
    @birthday = attributes[:birthday]
    @condition = attributes[:condition]
    @dr_id = attributes[:dr_id]
  end

  def self.all
    results = DB.exec("SELECT * FROM patients;")
    patients = []
    results.each do |result|
      name = result['name']
      birthday = result['birthday']
      condition = result['condition']
      dr_id = result['dr_id'].to_i
      patients << Patient.new({:name => name, :birthday => birthday, :condition => condition, :dr_id => dr_id})
    end
    patients
  end

  def save
    DB.exec("INSERT INTO patients (name, birthday, condition, dr_id) VALUES ('#{@name}', '#{@birthday}', '#{@condition}', #{@dr_id});")
  end

    def ==(another_patient)
    self.name == another_patient.name
  end
end




