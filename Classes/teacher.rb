require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name, specialization = 'Unknown', id = -1)
    super(age, name, id)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
