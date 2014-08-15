require 'pg'
require 'pry'

class Patient
  attr_reader(:name, :birthday, :dr_id, :id)

  def initialize(attributes)
    @name = attributes[:name]
    @birthday = attributes[:birthday]
    @dr_id = attributes[:dr_id]
    @id = attributes[:id]
  end

  # def initialize(attributes)
  #   @name = attributes['name']
  #   @birthday = attributes['birthday']
  #   @dr_id = attributes['dr_id']
  #   @id = attributes['id']
  # end

  def self.all
    results = DB.exec("SELECT * FROM patients;")
    patients = []
    results.each do |result|
      # new_patient = Patient.new(result)
      # patients << new_patient
      name = result['name']
      birthday = result['birthday']
      dr_id = result['dr_id'].to_i
      patients << Patient.new({:name => name, :birthday => birthday, :dr_id => dr_id})
    end
    patients
  end

  def save
    results = DB.exec("INSERT INTO patients (name, birthday, dr_id) VALUES ('#{@name}', '#{@birthday}', #{@dr_id}) RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_patient)
    self.name == another_patient.name
  end
end




