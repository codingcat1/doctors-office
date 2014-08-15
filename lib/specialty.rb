require 'pg'

class Specialty
  attr_reader(:attributes, :name)

  def initialize(attributes)
    @attributes = attributes
    @name = attributes[:name]
  end
end
