require_relative 'piece.rb'


class QueenPiece < Piece

  attr_reader :symbol, :color, :side, :pos

  def initialize(board, side)
    @board = board
    @pos = @side == 1 ? [0,3] : [7, 3]
    @side = side
  end

  def moves

  end

  def symbol
    "\u2655".encode('utf-8')
  end

  def color
    @side == 1 ? :black : :white
  end

end
