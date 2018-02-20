require_relative 'piece.rb'


class KingPiece < Piece

  attr_reader :symbol, :color

  def initialize(board, side)
    @board = board
    @pos = @side == 1 ? [0,4] : [7, 4]
    @side = side
  end

  def moves

  end

  def symbol
    "\u2654".encode('utf-8')
  end

  def color
    @side == 1 ? :black : :white
  end

end
