class Person
 def initialize(name = "Unknown", age, parent_permission=true)
  @id = id
  @name = name
  @age = age
end

def id
 @id
end

def is_of_age?
 if @age >= 18 
  return true
 else
  return false
 end
end

 Private : is_of_age?

 def can_use_services?
  if is_of_age? || parent_permission
   return true
 end

attr_reader :name
attr_writer :name
attr_reader :age
attr_writer :age
end


