require_relative "knight.rb"
require_relative "gameboard.rb"
require_relative "algorithm.rb"

knight_travails = Gameboard.new
knight_travails.play([0, 0],[1, 2]) # => The shortest path from [0, 0] to [1, 2] is [[0, 0], [1, 2]].

knight_travails.play([7, 7],[5, 3]) # => The shortest path from [7, 7] to [5, 3] is [[7, 7], [6, 5], [5, 3]].

knight_travails.play([3, 3],[4, 3]) # => The shortest path from [3, 3] to [4, 3] is [[3, 3], [1, 2], [3, 1], [4, 3]].

