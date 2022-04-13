# frozen_string_literal: true

#module Algorithm

  def travails(start, final)
    # Begin with an empty array which describes our pathway from start to finish
    solution = []
    solution << start
    # Assign a value of nil to every unvisited node and 0 to the final node
    distance = Array.new(8) { Array.new(8) { { distance: nil } } }
    distance[final[0]][final[1]][:distance] = 0
    # The knight at the last position is the first we check, hence the queue
    recursive_knight = Knight.new(final)
    queue = []
    queue << recursive_knight
    path_complete = false
    # Until we've labelled the nodes in feasible paths with distances...
      until path_complete
        # Shift out the first node in the queue; do the following for all new nodes that can be reached from that node
        base_node = queue.shift
        base_node.possible_moves.each do |new_node|
          # If we've reached the start from the end, stop this iteration
          if new_node == start
            path_complete = true
          end
          # If we haven't visited the node yet...
          if distance[new_node[0]][new_node[1]][:distance] == nil
            # We're moving 1 step away from the base node, so at the new node we'll increment the distance by 1
            distance[new_node[0]][new_node[1]][:distance] = distance[base_node.x_position][base_node.y_position][:distance] + 1
            # We'll repeat this process for the next node. Eventually we end up with a board full of numbers that represent node distances from the starting position
            queue << Knight.new(move)
          end      
        end
      end

    # In the next step, we iterate through the distance array and track the nodes with the lowest distance values
    shortest_seeker = Knight.new(start)
    shortest_path = 7
    current_node = nil
    # Until our iterator reaches the final node...
    until current_node == final
      # Do all the possible moves from this node
      shortest_seeker.possible_moves.each do |new_node|
        # If this new node isn't nil and its distance is less than the current path distance, add it to the solution array and go through this process again with it as your current node
        if distance[new_node[0]][new_node[1]][:distance] != nil && distance[new_node[0]][new_node[1]][:distance] < shortest_path
          shortest_path = distance[new_node[0]][new_node[1]][:distance]
          current_node = new_node
        end
      solution << current_node
      shortest_seeker = Knight.new(current_node)
      end
    end
    print_travails(solution, start, final)
  end

  def print_travails
    puts "The shortest path from #{start} to #{final} is #{solution.inspect}."
	print "\nThe Knight starts at #{start}.\n\n"
    knight_travails = Gameboard.new
	knight_travails.add_knight(solution.shift)
	knight_travails.display
	solution.each_with_index do |new_node, index| 
		knight_travails.move_knight(new_node)
		print "\nThen it moves to #{solution[index]}.\n\n"
		knight_travails.display
    end
  end
#end

