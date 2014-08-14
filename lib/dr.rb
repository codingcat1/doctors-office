require 'pg'

class Dr
  attr_reader(:attributes, :name, :id)

  def initialize(attributes)
    @attributes = attributes
    @name = attributes[:name]
    @id = attributes[:id]

  end

  def self.all
    database = PG.connect({:dbname => 'dr_office'})
    results = database.exec("SELECT * FROM dr;")
    drs = []
    results.each do |result|
      name = result['name']
      id = result['id']
      drs << Dr.new({:name => name, :id => id})
    end
    drs
  end

  def save
    database = PG.connect({:dbname => 'dr_office'})
    database.exec("INSERT INTO dr (name) VALUES ('#{@name}');")
  end

  def ==(another_dr)
    self.name == another_dr.name
  end
end
