class Ingredient

  @@all = []
  
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  # Ingredient.most_common_allergen should return the ingredient instance that the highest number of users are allergic to
  def self.most_common_allergen
    @@all.max_by do |ingredient|
      Allergy.all.select do |allergen|
        allergen.ingredient == ingredient
      end.count
    end
  end

end