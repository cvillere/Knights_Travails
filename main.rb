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

