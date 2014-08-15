require 'pg'

class Dr
  attr_reader(:attributes, :name, :id, :specialty_id, :insurance_id)

  def initialize(attributes)
    @attributes = attributes
    @name = attributes[:name]
    @id = attributes[:id]
    @specialty_id = attributes[:specialty_id]
    @insurance_id = attributes[:insurance_id]
  end

  def self.all
    results = DB.exec("SELECT * FROM dr;")
    drs = []
    results.each do |result|
      name = result['name']
      id = result['id']
      specialty_id = result['specialty_id'].to_i
      insurance_id = result['insurance_id'].to_i
      drs << Dr.new({:name => name, :id => id})
    end
    drs
  end

  def save
    DB.exec("INSERT INTO dr (name, specialty_id, insurance_id) VALUES ('#{@name}', #{@specialty_id}, #{@insurance_id});")
  end

  def ==(another_dr)
    self.name == another_dr.name
  end
end
