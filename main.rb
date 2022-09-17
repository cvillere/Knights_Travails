# this is the class for making the gameboard, knight, and potential moves
class GameBoard

  attr_accessor :board, :knight

  def initialize
    @board = Array.new(8) { Array.new(8)}
    @knight = knight
  end

  def find_move_position
    knight_moves = [[2, -1], [2, 1], [1, -2], [1, 2], [1, -2], [-1, 2], [-2, -1], [-2, 1]]
    # serve up each position on the board (loop)
    board.each_with_index do |row, row_index|
      row.each_with_index do |column, col_index|
        knight_moves.each do |km|
          position_on_board([row_index, col_index], km)
        end
      end
    end
  end

  def find_final_position(init_pos, move_amt)
    pt = 1
    final_pos = []
    final_pos[0] = init_pos[0] + move_amt[0]
    final_pos[1] = init_pos[1] + move_amt[1]
    if final_pos[0].between?(0, 7) & final_pos[1].between?(0, 7)
      # create node relationship here
      # create node for final position
    end
  end

end




=begin
#Not ready to commit just yet

# Graph node of the graph
class GraphNode

  attr_accessor :value, :neighbors

  def initialize(value)
    @value = value
    @neighbors = []
  end

  def add_edge(neighbor)
    @neighbors << neighbor
  end

end

# class representing graph object
class Graph

  attr_accessor :nodes

  def initialize
    @nodes = []
  end

  def add_node(value)
    @nodes << GraphNode.new(value)
  end

  

end

=end

