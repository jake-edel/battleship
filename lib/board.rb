class Board
  attr_reader :cells

  def initialize
    @cells = {}
  end

  def valid_coordinate?(string)
    /[a-d][1-4]/i.match?(string)
  end
end
