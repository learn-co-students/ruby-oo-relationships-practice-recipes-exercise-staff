class RecipeIngredient

  # RecipeIngredient is the join between an ingredient and a recipe. This is a has-many-through relationship
  attr_accessor :ingredient, :recipe
  
  @@all = []

  def initialize(recipe, ingredient)
    @recipe = recipe
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end


end







