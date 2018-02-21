require_relative 'piece.rb'


class KnightPiece < Piece
  include SteppingPiece
  attr_reader :symbol, :color

  def initialize(board, pos, color)
    @board = board
    @pos = pos
    @color = color
  end

  def move_diffs
    [[0, 1], [1, 0], [-1, 0], [0, -1], [1, 1], [-1, -1], [-1, 1], [1, -1]]
  end

  def symbol
    @color == :black ? "\u265A".encode('utf-8') : "\u2654".encode('utf-8')
  end

  def color
    @color
  end

end
