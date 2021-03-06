require_relative 'piece.rb'


class KingPiece < Piece
  include SteppingPiece
  attr_reader :symbol, :color

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  def move_diffs
    [[1, -2], [1, 2], [2, 1], [2, -1], [-1, -2], [-2, -1], [-1, 2], [-2, 1]]
  end

  def symbol
    @color == :black ? "\u265E".encode('utf-8') : "\u2658".encode('utf-8')
  end

  def color
    @color
  end

end
