# frozen_string_literal: true

# Class created for making undirected graph
class Graph
  attr_accessor :nodes

  def initialize
    @nodes = {}
  end

  def add_node(node)
    @nodes[node.value] = node
  end

  def add_edges(node1, node2)
    @nodes[node1.value].add_edge(@nodes[node2.value])
  end

  def determine_move_val(node1, node2)
    final_pos = []
    final_pos[0] = node1[0] + node2[0]
    final_pos[1] = node1[1] + node2[1]
    final_pos
  end

  def add_adjacencies(graph)
    all_nodes = graph.nodes
    all_nodes.each do |i, v|
      Constants::KNIGHT_MOVES.each do |km|
        checking_move = determine_move_val(i, km)
        if checking_move[0].between?(0, 7) && checking_move[1].between?(0, 7)
          graph.add_edges(graph.nodes[i], graph.nodes[checking_move])
        end
      end 
    end
    graph
  end

  def find_knight_path(graph, start_pos, end_pos)
    queue = []
    final_path = []
    distance = 0
    predecessor = nil
    pos_start = graph.nodes[start_pos]
    pos_start.distance = 0
    pos_start.predecessor = nil
    queue.push(pos_start)
    
    until final_path.include?(end_pos)
      current_item = queue.shift
      distance += distance
      predecessor = current_item
      current_item.adjacent_nodes.each do |i|
        i.distance = distance
        i.predecessor = predecessor unless final_path.include?(i.value)
        queue.push(i) unless final_path.include?(i.value)
      end
      final_path.push(current_item.value) unless final_path.include?(current_item.value)
      return find_shortest_path(graph, final_path.reverse) if current_item.value == end_pos
    end
    find_shortest_path(graph, final_path.reverse)
  end

  def find_shortest_path(graph, final_path)
    final_shortest_path = []
    current_item = final_path[0]
    loop_var = false
    until loop_var
      final_shortest_path.push(current_item)
      return final_shortest_path.reverse if final_shortest_path.include?(final_path[-1])
      current_item = graph.nodes[current_item].predecessor
      current_item = current_item.value 
      loop_var = true if final_shortest_path.include?(final_path[-1])
    end
    return final_shortest_path.reverse
  end
end