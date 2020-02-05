class Recipe

  @@all = []

  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  # Recipe.most_popular should return the recipe instance with the highest number of users (the recipe that has the most recipe cards)
  def self.most_popular
    Recipe.all.max_by do |recipe|
      RecipeCard.all.select do |rc|
        rc.recipe == recipe
      end.count
    end
  end

  # Recipe#users should return the user instances who have recipe cards with this recipe
  def users
    x=RecipeCard.all.select do |rc|
      rc.recipe === self
    end
    x.map do |recipe|
      recipe.user
    end
  end

  # Recipe#ingredients should return all of the ingredients in this recipe
  def ingredients
    x = RecipeIngredient.all.select do |rec_ing|
      rec_ing.recipe == self
    end
    y = x.map do |recipe|
      recipe.ingredient
    end
    y
  end

  # Recipe#allergens should return all of the Ingredients in this recipe that are allergens for Users in our system.
  def allergens
    ingredients.select do |ingredient|
      Allergy.all.map do |allergen|
        allergen.ingredient
      end.uniq.include?(ingredient)
    end
  end

  # Recipe#add_ingredients should take an array of ingredient instances as an argument, and associate each of those ingredients with this recipe
  def add_ingredients(ingredients_array)
  ingredients_array.each do |ingredient|
    RecipeIngredient.new(self, ingredient)
    end
  end

end