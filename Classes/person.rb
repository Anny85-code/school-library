class Person
  attr_reader :name
  attr_writer :name
  attr_reader :age
  attr_writer :age
  attr_reader :id

  def initialize(name = "Unknown", age, parent_permission: true)
    @name = name
    @age = age
  end

  def is_of_age?
    @age >= 18
  end

  private :is_of_age?

  def can_use_services?
    is_of_age? || parent_permission
  end
end

