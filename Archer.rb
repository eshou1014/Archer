class Arrow
  attr_accessor :arrows
  def initialize
    @arrows = 10
  end
end

class Bow

  attr_accessor :can_fire, :target_status_alive, :arrows, :hp
  def initialize
    @can_fire = false
    @target_status_alive = true
    @arrows = Arrow.new
    @hp = 3
  end

  def ready_fire
    self.can_fire = true
    puts "Ready to kill?"
  end

  def hit?
    hit_or_miss = rand(1..3)
     if target_status_alive == true && can_fire == true && hit_or_miss == 1
      self.hp -= 1
      self.arrows.arrows -= 1
      puts "You struck him in the chest, his hp is now #{hp}."
      puts "You have #{arrows.arrows} left."
    else
      self.arrows.arrows -= 1
      puts "You missed"
      puts "You have #{arrows.arrows} left."
    end
  end

  def dead?
    if hp == 0
      puts "You killed him."
      target_status_alive == false
      true
    else
      puts "He's still alive."
      false
    end
  end

  def arrow_holster
    puts "You have #{arrows.arrows} now"
  end
end

b = Bow.new
b.arrow_holster
b.ready_fire
until b.dead? do
  b.hit?
  sleep(1)
end


