require 'json'

class Rental
  attr_accessor :date
  attr_reader :book, :person

  def initialize(date, person, book)
    @date = date

    @person = person
    @person.rentals << self

    @book = book
    @book.rentals << self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'rental' => {
        'date' => @date,
        'person' => @person,
        'book' => @book
      }
    }.to_json(*args)
  end

  def self.json_create(object)
    object_variables = []
    object['rental']&.each { |_, value| object_variables.push(value) }
    new(*object_variables)
  end
end
