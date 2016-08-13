class Person
  def initialize(name)
    @name = name
  end

  def greeting
    puts "My name is #{@name}"
  end
end
#sub class Student
class Student < Person
  def learn
    puts "I get it!"
  end
end
#sub class Instructor
class Instructor < Person
  def teach
    puts "Everything in Ruby is an Object!"
  end
end
#
chris = Instructor.new("Chris")
chris.greeting
chris.teach


#chris.learn #fails since this method is out of scope
#
cristina = Student.new("Cristina")
cristina.greeting
cristina.learn
#cristina.teach #fails since method is out of scope
