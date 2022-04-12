module ConsoleUI
  def person_input_data
    permission = true
    specialization = ''
    print 'To create a student, press 1, to create a teacher, press 2 : '
    option = gets.chomp.to_i
    print 'Enter age: '
    age = gets.chomp.to_i
    print 'Enter name: '
    name = gets.chomp
    puts option
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
end