require 'pg'

class Dr
  attr_reader(:attributes, :name, :id, :specialty)

  def initialize(attributes)
    @attributes = attributes
    @name = attributes[:name]
    @id = attributes[:id]
    @specialty = attributes[:specialty]
  end

  def self.all
    results = DB.exec("SELECT * FROM dr;")
    drs = []
    results.each do |result|
      name = result['name']
      id = result['id']
      drs << Dr.new({:name => name, :id => id})
    end
    drs
  end

  def save
    DB.exec("INSERT INTO dr (name, specialty) VALUES ('#{@name}', '#{specialty}');")
  end

  def ==(another_dr)
    self.name == another_dr.name
  end
end
