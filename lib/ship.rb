class Ship
  attr_reader :name, :length, :health, :hit
  def initialize(name, length)
    @name = name
    @length = length
    @health = health
    @hits = 0

  end

    def health
      @health = @length
    end

   def hit
     @hits +=1
   end


   def sunk?
    @hits >= health
   end
end
