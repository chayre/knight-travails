# frozen_string_literal: true

require_relative "knight.rb"
require_relative "algorithm.rb"

# Contains methods to play the game and print the board
class Gameboard
  attr_accessor :piece, :positions, :knight

include Algorithm

  def initialize
    @piece = {white_knight: "♞"}
    # Create an 8x8 array full of spaces which represents the gamespace positions
    @position = Array.new(8) { Array.new(8, ' ') }
  end

  # Display the board by 
  def display_board
    puts '   '
    x_axis
    rows
    @position.each_index do |row|
      print "#{row}  "
        @position[row].each_index do |column|
          print "|  #{@position[column][row]}  "
        end
        puts '|'
        rows
    end
    puts '   '
  end

  def rows
    print '   '
    8.times.each { print '+-----' }
    puts '+'
  end

  # Print x-axis labels from 0 to 7
  def x_axis
    print '   '
    (0..7).each { |label| print "   #{label}  " }
    puts ''
  end

  # Add knight to the gameboard
  def add_knight(position)
  @knight = Knight.new(position)
  @position[@knight.x_position][@knight.y_position] = @piece[:white_knight]
  end

  # Delete knight from previous gameboard position and add to new position
  def move_knight(position)
    @position[@knight.x_position][@knight.y_position] = " "
    @knight.x_position = position[0]
    @knight.y_position = position[1]
    @position[@knight.x_position][@knight.y_position] = @piece[:white_knight]
  end

  def play(start, finish)
    dijkstra_algorithm(start, finish)
  end

end