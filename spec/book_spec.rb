require './Classes/book'
require './Classes/person'

describe Book do
  context 'when instantiated' do
    it 'with title and author should create a book' do
      book = Book.new('Alchemist', 'Chloe')
      expect(book.class).to eq Book
      expect(book.title).to eq 'Alchemist'
      expect(book.author).to eq 'Chloe'
    end
  end
  context 'when calling add_rental method' do
    it 'with person object should create a rental' do
      book = Book.new('Alchemist', 'Chloe')
      person = Person.new(17, 'John', parent_permission: true)
      rental = book.add_rental person
      expect(book.rentals.length).to be >= 1
      expect(rental.class).to eq Rental
      expect(rental.date).to eq Time.now.strftime('%Y-%m-%d')
    end
  end
end
