class Dog
  attr_reader :name
  def initialize(name)
    @name = name
  end
  def empt
  end
end
dog_1= Dog.new("Boris")
dog_2= Dog.new("Bruno")
dog_3= Dog.new("Hector")

class Cat
  attr_reader :name
  def initialize(name)
    @name = name
  end
end
cat_1= Cat.new("Queen Elizabeth I")
cat_2= Cat.new("Lulu")
cat_3= Cat.new("Victoria")
 
class AnimalShelter
  attr_reader :shelter
  def initialize
    @shelter = []
  end
  def add_to_shelter(animal)
    @shelter << animal
  end
  def adopt_animal
      @shelter.shift
  end
  def shelter_is_empty?
   p @shelter.empty?
  end   
  def peek_into_shelter
    @shelter.first
  end
  def choose_animal(animal)
    @shelter.each do |object|
      
      if animal.capitalize == object.class.inspect
        return @shelter.delete(object).name
        break
      end
    end
     p "No more #{animal.downcase} in the shelter"
  end
end

my_shelter = AnimalShelter.new
my_shelter.add_to_shelter(dog_1)
my_shelter.add_to_shelter(cat_1)
my_shelter.add_to_shelter(cat_2)
my_shelter.add_to_shelter(cat_3)
my_shelter.add_to_shelter(dog_2)
my_shelter.add_to_shelter(dog_3)

p my_shelter
my_shelter.choose_animal('cat')
p my_shelter
my_shelter.choose_animal('cat')
p my_shelter
my_shelter.choose_animal('DOG')
p my_shelter
my_shelter.shelter_is_empty?
my_shelter.choose_animal('cAT')

my_shelter.choose_animal('cAT')
my_shelter.choose_animal('DOG')
my_shelter.choose_animal('DOG')
my_shelter.choose_animal('DOG')
