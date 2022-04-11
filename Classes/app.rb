require_relative 'person'
require_relative 'student'
require_relative 'book'
require_relative 'classroom'
require_relative 'teacher'
require_relative 'rental'
require_relative 'command_option'

class App
  attr_accessor :command_options

  def initialize
    @books = []
    @people = []
    @rentals = []
    @command_options = CommandOption.new.options
  end

  def list_of_options
    puts
    puts 'Choose an option by entering a number: '
    @command_options.each_with_index { |option, index| puts "#{index + 1} - #{option[0].capitalize}" }

    puts "#{@command_options.length + 1} - Exit"
  end

  def option(input)
    if input.to_i >= 1 && input.to_i <= @command_options.length
      send(@command_options[input.to_i - 1][1])
    elsif input.to_i == @command_options.length + 1
      puts 'Thank You for using my School Library!'
      exit
    else
      puts "Please enter a number between 1 and #{@command_options.length + 1}."
    end
  end

  def console_entry_point
    puts 'Welcome to my School Library!'
    until list_of_options
      input = gets.chomp
      option input
    end
  end

  def create_person
    print 'To create a student, press 1, to create a teacher, press 2 : '
    option = gets.chomp
    
    print 'Enter age: '
    age = gets.chomp.to_i
    print 'Enter name: '
    name = gets.chomp

    case option
    when '1'
      create_student(age, name)
    when '2'
      create_teacher(age, name)
    else
      puts 'Invalid input. Try again'
    end
  end

  def create_student(age, name)
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase
    permission = if parent_permission == 'y' then true 
                else false
                end
    student = Student.new(age, name, parent_permission: permission)
    @people << student
    puts 'Student created successfully'
  end

  def create_teacher(age, name)
    print 'Enter teacher specialization: '
    specialization = gets.chomp
    teacher = Teacher.new(age, name, specialization)
    @people << teacher
    puts 'Teacher created successfully'
  end

  def list_all_people
    puts 'Database is empty! Add a person.' if @people.empty?
    @people.each do |person|
      puts "[#{person.class.name}] Age: #{person.age}, Name: #{person.name}
      id: #{person.id}"
    end
  end

  def create_book
    puts 'Create a new book'
    print 'Enter title: '
    title = gets.chomp
    puts 'Enter author: '
    author = gets
    book = Book.new(title, author)
    @books.push(book)
    puts "Book #{title} created successfully."
  end

  def list_all_books
    puts 'Database is empty! Add a book.' if @books.empty?
    @books.each { |book| puts "[Book] Title: #{book.title}, Author: #{book.author}" }
  end

  def create_rental
    puts 'Select which book you want to rent by entering its number'
    @books.each_with_index { |book, index| puts "#{index}) Title: #{book.title}, Author: #{book.author}" }

    book_id = gets.chomp.to_i

    puts 'Select a person from the list by its number'
    @people.each_with_index do |person, index|
      puts "#{index}) [#{person.class.name}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end

    person_id = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp.to_s

    rental = Rental.new(date, @people[person_id], @books[book_id])
    @rentals << rental

    puts 'Rental created successfully'
  end

  def list_all_rentals
    print 'To see person rentals enter the person ID: '
    id = gets.chomp.to_i

    puts 'Rented Books:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book '#{rental.book.title}' by #{rental.book.author}" if rental.person.id == id
    end
  end
end
