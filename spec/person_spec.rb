require './Classes/person'

describe Person do
  context 'when instantiated' do
    it 'with age, name, id and parent_permission should create a person' do
      person = Person.new(23, 'Tekle', 454, parent_permission: false)
      expect(person.class).to eq Person
      expect(person.age).to eq 23
      expect(person.name).to eq 'Tekle'
      expect(person.id).to eq 454
      expect(person.parent_permission).to be_falsey
    end

    it 'without name and id should create a person with Unknown name and id between 1 to 1000' do
      person = Person.new(23, parent_permission: false)
      expect(person.name).to eq 'Unknown'
      expect(person.id).to be_between(1, 1000)
    end
  end

  context 'when calling add_rental method' do
    it 'with book object should create a rental' do
      book = Book.new('Alchemist', 'Chloe')
      person = Person.new(17, 'John', parent_permission: true)
      rental = person.add_rental book
      expect(person.rentals.length).to be >= 1
      expect(rental.class).to eq Rental
      expect(rental.date).to eq Time.now.strftime('%Y-%m-%d')
    end
  end

  context 'when calling can_use_services? method' do
    it 'with age >= 18 should return true' do
      person = Person.new(18, 'John', parent_permission: false)
      expect(person.can_use_services?).to be_truthy
    end

    it 'with parent_permission: true should return true' do
      person = Person.new(15, 'John', parent_permission: true)
      expect(person.can_use_services?).to be_truthy
    end

    it 'with parent_permission: false and age < 18 should return false' do
      person = Person.new(15, 'John', parent_permission: false)
      expect(person.can_use_services?).to be_falsey
    end
  end
end