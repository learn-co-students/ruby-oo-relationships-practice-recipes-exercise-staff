class Allergy
  
  # An Allergy is a join between a user and an ingredient. This is a has-many-through relationship.

  @@all = []

  attr_accessor :user, :ingredient

  def initialize(user, ingredient)
    @user = user
    @ingredient = ingredient
    @@all << self
  end

  def self.all
    @@all
  end

end
