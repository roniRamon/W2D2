require_relative 'piece.rb'


class QueenPiece < Piece
  include SlidingPiece
  attr_reader :symbol, :color, :pos

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  def move_dirs
    [:diag, :horiz]
  end

  def symbol
      @color == :black ? "\u265B".encode('utf-8') : "\u2655".encode('utf-8')
  end

  def color
    @color
  end

end
