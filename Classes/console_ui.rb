module ConsoleUI
  

  def get_person_input_data
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
    {:option => option, :age => age, :name => name, :permission => permission, :specialization => specialization}
  end
end