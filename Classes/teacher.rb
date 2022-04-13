require_relative 'person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(age, name, specialization = 'Unknown', id = -1, parent_permission: true)
    super(age, name, id, parent_permission: true)
    @specialization = specialization
    @parent_permission = parent_permission
  end

  def can_use_services?
    true
  end
end
