require 'pg'

class Specialty
  attr_reader(:attributes, :name, :id)

  def initialize(attributes)
    @attributes = attributes
    @name = attributes[:name]
    @id = attributes[:id]
  end

  def self.all
    results = DB.exec("SELECT * FROM specialty;")
    specialty = []
    results.each do |result|
      name = result['name']
    specialty << Specialty.new({:name => name})
    end
  specialty
  end

  def save
    results = DB.exec("INSERT INTO specialty (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_specialty)
    self.name == another_specialty.name
  end
end
