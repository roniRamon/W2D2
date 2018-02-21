require_relative 'piece.rb'


class BishopPiece < Piece
  include SlidingPiece
  attr_reader :symbol, :color, :pos

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  def move_dirs
    :diag
  end

  def symbol
    @color == :black ? "\u265D".encode('utf-8') : "\u2657".encode('utf-8')
  end

  def color
    @color
  end

end
