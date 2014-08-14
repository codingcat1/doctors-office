class Insurance
  attr_reader(:name, :attributes)

  def initialize(attributes)
    @name = attributes[:name]
    @attributes = attributes
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
    DB.exec("INSERT INTO insurance (name) VALUES ('#{@name}');")
  end

  def ==(another_insurance)
    self.name == another_insurance.name
  end

end
