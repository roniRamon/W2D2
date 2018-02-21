require_relative 'piece.rb'


class RookPiece < Piece
  include SlidingPiece
  attr_reader :symbol, :color, :pos

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  def move_dirs
    :horiz
  end

  def symbol
    @color == :black ? "\u265C".encode('utf-8') : "\u2656".encode('utf-8')
  end

  def color
    @color
  end

end
