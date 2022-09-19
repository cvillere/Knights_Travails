# this is the class for making the gameboard, knight, and potential moves
class GameBoard

  attr_accessor :board, :knight

  def initialize
    @board = Array.new(8) { Array.new(8)}
    @knight = knight
    @graph = Graph.new
  end

  KNIGHT_MOVES.freeze = [[2, -1], [2, 1], [1, -2], [1, 2], [1, -2], [-1, 2], [-2, -1], [-2, 1]]

  def find_move_position
    # serve up each position on the board (loop)
    board.each_with_index do |row, row_index|
      row.each_with_index do |column, col_index|
        KNIGHT_MOVES.each do |km|
          # create node with [row_index, col_index]
          board_node = create_node([row_index, col_index])
          find_final_position([row_index, col_index], km, board_node)
        end
      end
    end
  end

  def find_final_position(init_pos, move_amt, board_node)
    final_pos = []
    final_pos[0] = init_pos[0] + move_amt[0]
    final_pos[1] = init_pos[1] + move_amt[1]
    if final_pos[0].between?(0, 7) & final_pos[1].between?(0, 7)
      # create node for final position & create node relationship here
      new_graph_node = create_node(final_pos)
      @graph.add_edge(board_node, new_graph_node)
    end
  end

=begin
  def create_graph
    Graph.new
  end

  def connect_nodes(first_pos, final_pos)
  end
=end

  def create_node(value)
    board_node = GraphNode.new
    board_node.value = value
    board_node
  end

end

# class that will make nodes of the graph
class GraphNode

  attr_accessor :value, :adjacent_nodes

  def initialize(value)
    @value = value
    @adjacent_nodes = []
  end

  def add_edge(adjacent_node)
    @adjacent_nodes << adjacent_node
  end
end

# Class created for making undirected graph
class Graph

  def initialize
    @nodes = {}
  end

  def add_node(node)
    @nodes[node.value] = node
  end

  def add_edges(node1, node2)
    @nodes[node1].add_edge(@nodes[node2])
    @nodes[node2].add_edge(@nodes[node1])
  end

end




=begin
#Not ready to commit just yet

# Graph node of the graph
class GraphNode

  attr_accessor :value, :adjacent_nodes

  def initialize(value)
    @value = value
    @adjacent_nodes = []
  end

  def add_edge(adjacent_node)
    @adjacent_nodes << adjacent_node
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

def create_graph
    Graph.new
  end

  def connect_nodes(first_pos, final_pos)
  end

=end

