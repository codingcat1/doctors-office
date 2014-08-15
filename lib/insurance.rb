class Insurance
  attr_reader(:name, :attributes, :id)

  def initialize(attributes)
    @name = attributes[:name]
    @attributes = attributes
    @id = attributes[:id]
  end

  def self.all
    results = DB.exec("SELECT * FROM insurance;")
    insurances = []
    results.each do |result|
      name = result['name']
    insurances << Insurance.new({:name => name})
    end
  insurances
  end

  def save
    results = DB.exec("INSERT INTO insurance (name) VALUES ('#{@name}') RETURNING id;")
    @id = results.first['id'].to_i
  end

  def ==(another_insurance)
    self.name == another_insurance.name
  end

end
