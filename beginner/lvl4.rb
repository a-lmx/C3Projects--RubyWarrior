class Player
  attr_reader :health
  
  def initialize
    @health = 20
  end
  
  def play_turn(warrior)
    if warrior.health < @health
      if warrior.feel.empty?
        warrior.walk!
      else
        warrior.attack!
      end
    elsif warrior.health < 20
      warrior.rest!
    else
      if !warrior.feel.empty?
        warrior.attack!
      else
        warrior.walk!
      end
    end
    @health = warrior.health
  end
end
