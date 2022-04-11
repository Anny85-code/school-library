class CommandOption
  def options
  [
    ['List of books', :list_all_books],
    ['List of people', :list_all_people],
    ['create a person', :create_person],
    ['create a book', :create_book],
    ['create a rental', :create_rental],
    ['List all rentals for a given person', :list_all_rentals]
    ]
  end
end