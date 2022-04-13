module ConsoleUI
  def person_input_data
    permission = true, specialization = ''
    print 'To create a student, press 1, to create a teacher, press 2 : '
    option = gets.chomp.to_i
    print 'Enter age: '
    age = gets.chomp.to_i
    print 'Enter name: '
    name = gets.chomp
    case option
    when 1
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase
      permission = parent_permission == 'y'
    when 2
      print 'Enter teacher specialization: '
      specialization = gets.chomp
    else
      puts 'Invalid input. Try again'
    end
    { option: option, age: age, name: name, permission: permission, specialization: specialization }
  end

  def book_input_data
    puts 'Create a new book'
    print 'Enter title: '
    title = gets.chomp
    puts 'Enter author: '
    author = gets
    { title: title, author: author }
  end

  def rental_input_data(books, people)
    puts 'Select which book you want to rent by entering its number'
    books.each_with_index do |book, index|
      book_object = JSON.parse(book, create_additions: true)
      puts "#{index}) Title: #{book_object.title}, Author: #{book_object.author}"
    end

    book_id = gets.chomp.to_i

    puts 'Select a person from the list by its number'
    people.each_with_index do |person, index|
      person_object = JSON.parse(person, create_additions: true)
      puts "#{index}) [#{person_object.class.name}]
        Name: #{person_object.name},
        ID: #{person_object.id},
        Age: #{person_object.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s
    { date: date, book_id: book_id, person_id: person_id }
  end
end
