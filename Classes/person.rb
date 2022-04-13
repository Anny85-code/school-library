require_relative 'nameable'
require_relative 'rental'
require 'date'

class Person < Nameable
  attr_accessor :name, :age, :rentals
  attr_reader :id

  def initialize(age, name = 'Unknown', id = -1, parent_permission: true)
    @id = if id == -1
            Random.rand(1..1000)
          else
            id
          end
    @name = name
    @age = age
    @parent_permission = parent_permission
    @date = DateTime.now
    @rentals = []
    super()
  end

  def add_rental=(person)
    Rental.new(@date, person, self)
  end

  def of_age?
    @age >= 18
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'person' => {
        'age' => @age,
        'name' => @name,
        'parent_permission' => @parent_permission,
        'id' => @id
      }
    }.to_json(*args)
  end

  def self.json_create(object)
    object_variables = []
    object['person'].each { |_, value| object_variables.push(value) }
    new(*object_variables)
  end

  private :of_age?

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end
end
