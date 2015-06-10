class Player
  attr_reader :health
  
  def initialize
    @health = 20
  end

  def play_turn(warrior)
    if warrior.feel.enemy?
      warrior.attack!
    elsif warrior.feel(:backward).captive?
      warrior.rescue!(:backward)
    elsif warrior.feel(:backward).wall? && warrior.health < 20
      warrior.rest!
    elsif warrior.feel(:backward).empty? && warrior.health < 10
      warrior.walk!(:backward)
    else
      warrior.walk!
    end
    @health = warrior.health
  end
end
