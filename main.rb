require_relative('/Users/christianvillere/the_odin_project/Ruby/Knight/constants.rb')
require_relative('/Users/christianvillere/the_odin_project/Ruby/Knight/search_functions.rb')
require_relative('/Users/christianvillere/the_odin_project/Ruby/Knight/graph_class.rb')

# this is the class for making the gameboard, knight, and potential moves
class GameBoard
  include SearchFunctions
  include Constants
  attr_accessor :board, :knight, :graph

  def initialize
    @board = Array.new(8) { Array.new(8) }
    @knight = knight
    @graph = Graph.new
  end

  def create_graph
    @board.each_with_index do |row, row_index|
      row.each_with_index do |_column, col_index|
        board_node = create_node([row_index, col_index])
        @graph.add_node(board_node)
      end
    end
    @graph 
  end

  def determine_move_val(node1, node2)
    final_pos = []
    final_pos[0] = node1[0] + node2[0]
    final_pos[1] = node2[1] + node2[1]
    final_pos
  end

  def run_game(initial_object)
    puts Constants::BOARD
    start_pos = find_start_pos
    end_pos = find_end_pos
    check_inputs = check_inputs(start_pos, end_pos)
    my_graph = initial_object.create_graph
    final_graph = my_graph.add_adjacencies(my_graph)
    knight_path = final_graph.find_knight_path(final_graph, check_inputs[0], check_inputs[1])
    puts '--------------------'
    p knight_path
    play_again
  end

  def play_again
    puts '--------------------'
    puts 'Play again? Type 1 for yes'
    player_rep = gets.chomp
    return if player_rep != "1" 
    new_board = GameBoard.new
    run_game(new_board)
  end

  def create_node(value)
    board_node = Node.new
    board_node.value = value
    board_node
  end
end

# class that will make nodes of the graph
class Node
  attr_accessor :value, :adjacent_nodes, :predecessor, :distance

  def initialize
    @value = value
    @adjacent_nodes = []
    @predecessor = nil
    @distance = nil
  end

  def add_edge(adjacent_node)
    @adjacent_nodes << adjacent_node
  end
end

my_object = GameBoard.new
my_object.run_game(my_object)


