require 'pg'

class Specialty
  attr_reader(:attributes, :name)

  def initialize(attributes)
    @attributes = attributes
    @name = attributes[:name]
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
    DB.exec("INSERT INTO specialty (name) VALUES ('#{@name}');")
  end

  def ==(another_specialty)
    self.name == another_specialty.name
  end
end
