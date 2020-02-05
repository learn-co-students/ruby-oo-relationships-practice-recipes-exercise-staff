class User

  @@all = []
  
  attr_accessor :name

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end
  
  # User#recipes should return all of the recipes this user has recipe cards for.
  def recipes
    RecipeCard.all.map do |rc|
      rc.recipe
    end
  end
  
  # User#add_recipe_card should accept a recipe instance as an argument, as well as a date and rating, and create a new recipe card for this user and the given recipe
  def add_recipe_card(recipe, date, rating)
    RecipeCard.new(recipe, date, rating, self)
  end
  
  # User#declare_allergy should accept anIngredient instance as an argument, and create a new Allergy instance for this User and the given Ingredient
  def declare_allergy(ingredient)
    Allergy.new(self, ingredient)
  end
  
  # User#allergens should return all of the ingredients this user is allergic to
  def allergens
    x=Allergy.all.select do |allergen|
      allergen.user == self
    end
    x.map do |allergen|
      allergen.ingredient
    end
    x
  end
  
  # User#top_three_recipes should return the top three highest rated recipes for this user.
  def top_three_recipes
    y = user_recipe_cards_helper_method.sort_by do |recipe|
      recipe.rating
    end.last(3)
    y.map do |card|
      card.recipe
    end
  end
  
  # User#most_recent_recipe should return the recipe most recently added to the user's cookbook.
  def most_recent_recipe
    user_recipe_cards_helper_method.sort_by do |rc|
      rc.date
    end.last
  end
  
  def user_recipe_cards_helper_method
    RecipeCard.all.select do |rc|
      rc.user == self
    end
  end
  
  # User#safe_recipes should return all recipes that do not contain ingredients the user is allergic to
  def safe_recipes
    recipes.reject do |recipe|
      recipe.ingredients.any? do |ingredient|
        allergens.include?(ingredient)
      end
    end.uniq
  end

end