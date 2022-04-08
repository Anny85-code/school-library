require_relative 'rental'
require 'date'

class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @date = DateTime.now
    @rentals = []
  end

  def add_rental=(person)
    Rental.new(@date, person, self)
  end
end
