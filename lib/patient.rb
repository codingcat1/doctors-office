class Patient
  attr_reader(:name, :birthday, :condition)

  def initialize(attributes)
    @name = attributes[:name]
    @birthday = attributes[:birthday]
    @condition = attributes[:condition]
  end

end




