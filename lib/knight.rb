class Knight
  attr_accessor :moveset, :x_position, :y_position, :possible_moves

  def initialize(position)
    @moveset = [
                [-1, -2],
                [-2, -1],
                [-2, +1],
                [-1, +2],
                [+1, -2],
                [+2, -1],
                [+2, +1],
                [+1, +2]
            ]
    @x_position = position[0]
    @y_position = position[1]
    @possible_moves = find_possible_moves
  end

  def find_possible_moves
    possible = []
    @moveset.each do |move|
      if (0..7).include?(move[0] + @x_position) && (0..7).include?(move[1] + @y_position)
        possible << [move[0] + @x_position, move[1] + @y_position]
      end
    end
    possible
  end

end