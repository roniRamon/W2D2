require_relative 'piece.rb'
require 'singleton'

class NullPiece < Piece
  include Singleton

  attr_reader :symbol, :color

  def initialize
  end

  def moves
  end

  def symbol
    " "
  end

  def color
    :red
  end

end
