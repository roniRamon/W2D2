require 'colorize'
require_relative "cursor"
require_relative "board"
require 'byebug'

class Display

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    current_idx = @cursor.cursor_pos

    print "  a  b  c  d  e  f  g  h\n"
    @board.rows.each_with_index do |row, idx|
      print idx + 1
      row.each_with_index do |col, idx2|
        if [idx, idx2] == current_idx
          print " #{col.symbol} ".colorize(:background => :red)
        elsif idx2.odd? && idx.even? || idx2.even? && idx.odd?
          print " #{col.symbol} ".colorize(:background => :white)
        else idx2.odd? && idx.odd? || idx2.even? && idx.even?
          print " #{col.symbol} ".colorize(:background => :black)
        end
      end
      print " #{idx + 1} "
      puts
    end
    print "  a  b  c  d  e  f  g  h\n"
  end


end
