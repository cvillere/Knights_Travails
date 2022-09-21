require 'pp'

module Constants
  KNIGHT_MOVES = [[2, -1], [2, 1], [1, -2], [1, 2], [1, -2], [-1, 2], [-2, -1], [-2, 1]]
end

# this is the class for making the gameboard, knight, and potential moves
class GameBoard

  attr_accessor :board, :knight

  def initialize
    @board = Array.new(8) { Array.new(8)}
    @knight = knight
    @graph = Graph.new
  end

  def find_move_position
    board.each_with_index do |row, row_index|
      row.each_with_index do |column, col_index|
        board_node = create_node([row_index, col_index])
        @graph.add_node(board_node)
        Constants::KNIGHT_MOVES.each do |km|
          find_final_position([row_index, col_index], km, board_node)
        end
      end
    end
    @graph
  end

  def find_final_position(init_pos, move_amt, board_node)
    final_pos = []
    final_pos[0] = init_pos[0] + move_amt[0]
    final_pos[1] = init_pos[1] + move_amt[1]
    if final_pos[0].between?(0, 7) & final_pos[1].between?(0, 7)
      # create node for final position & create node relationship here
      new_graph_node = create_node(final_pos)
      @graph.add_node(new_graph_node)
      @graph.add_edges(board_node, new_graph_node)
    end
  end

  def create_node(value)
    board_node = Node.new
    board_node.value = value
    board_node
  end

end

# class that will make nodes of the graph
class Node

  attr_accessor :value, :adjacent_nodes

  def initialize
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
    @nodes[node1.value].add_edge(@nodes[node2.value])
    @nodes[node2.value].add_edge(@nodes[node1.value])
  end
end

initial_graph = GameBoard.new.find_move_position
p initial_graph.inspect


