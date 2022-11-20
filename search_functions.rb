# frozen_string_literal: true

# functions to get user inputs
module SearchFunctions
  def find_start_pos
    matching_phrase = /[0-7]/
    puts 'Choose a correct STARTING ROW position (0 to 7).'
    start_row_pos = gets.chomp
    find_start_pos if (start_row_pos =~ matching_phrase).nil?
    puts 'Choose a correct STARTING COLUMN position (0 to 7).'
    start_col_pos = gets.chomp
    find_start_pos if (start_col_pos =~ matching_phrase).nil?
    start_position = [start_row_pos.to_i, start_col_pos.to_i]
  end

  def find_end_pos
    matching_phrase = /[0-7]/
    puts 'Choose a correct ENDING ROW position (0 to 7).'
    end_row_pos = gets.chomp
    find_end_pos if (end_row_pos =~ matching_phrase).nil?
    puts 'Choose a correct ENDING COLUMN position (0 to 7).'
    end_col_pos = gets.chomp
    find_end_pos if (end_col_pos =~ matching_phrase).nil?
    end_position = [end_row_pos.to_i, end_col_pos.to_i]
  end

  def check_inputs(pos_start, pos_end)
    if pos_start == pos_end
      puts "you entered #{pos_start} & #{pos_end}" 
      puts "Please choose different board coordinates!"
      pos_start = find_start_pos
      pos_end = find_end_pos
      check_inputs(pos_start, pos_end)
    end
    [pos_start, pos_end]
  end
end
