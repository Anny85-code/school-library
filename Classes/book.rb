require_relative 'rental'
require 'date'

class Book
  attr_accessor :title, :author, :rentals
   
  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental=(person)
    Rental.new(@date, person, self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'book' => {
        'title' => @title,
        'author' => @author
      }
    }.to_json(*args)
  end

  def self.json_create(object)
    object_variables = []
    object['book'].each { |_, value| object_variables.push(value) }
    new(*object_variables)
  end
end
