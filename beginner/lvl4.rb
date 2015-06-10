class Player
  attr_reader :health
  
  def initialize
    @health = 20
  end
  
  def check_empty_space(warrior)
    if warrior.feel.empty?
        warrior.walk!
    else
        warrior.attack!
    end
  end
  
  def play_turn(warrior)
    if warrior.health < @health
      check_empty_space(warrior)
    elsif warrior.health < 20
      warrior.rest!
    elsif warrior.feel.captive?
      warrior.rescue!
    else
      check_empty_space(warrior)
    end
    @health = warrior.health
  end
end
