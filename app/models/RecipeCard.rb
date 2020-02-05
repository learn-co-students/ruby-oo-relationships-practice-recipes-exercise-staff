# A RecipeCard is the join between a user instance and a recipe instance. This is a has-many-through relationship. Build the following methods on the RecipeCard class:
class RecipeCard
  
  @@all = []

  attr_accessor :recipe, :date, :rating, :user

  def initialize(recipe, date, rating, user)
    @recipe = recipe
    @date = date
    @rating = rating
    @user = user
    @@all << self
  end

  def self.all
    @@all
  end

end