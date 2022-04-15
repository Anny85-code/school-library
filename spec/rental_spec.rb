require './Classes/rental'
require './Classes/person'
require './Classes/book'

describe Rental do
  context 'when instantiated' do
    it 'with date, book, and student should create a rental' do
      person = Person.new(23, 'Joe')
      book = Book.new('Alchemist', 'Chloe')
      date = Time.now.strftime('%Y-%m-%d')
      rental = Rental.new(date, book, person)

      expect(rental.class).to eq Rental
      expect(rental.date).to eq date
      expect(person.rentals.length).to be >= 1
      expect(book.rentals.length).to be >= 1
    end
  end
end
