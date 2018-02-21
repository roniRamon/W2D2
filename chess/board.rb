require_relative 'piece.rb'
require_relative 'null_piece.rb'
require 'byebug'

class Board
  attr_reader :rows

  def initialize
    @rows = Array.new(8) { Array.new(8){ NullPiece.instance} }
    # @sentinel = NullPiece.new
  end

  def [](pos)
    x, y = pos
    @rows[x][y]
  end

  def []=(pos, val)
    x, y = pos
    @rows[x][y] = val
  end



  def move_piece(start_pos, end_pos)
    begin
      if self[start_pos].nil?
        raise NoPieceError
      else
        temp_piece = self[start_pos]
        self[start_pos] = NullPiece
      end
      if valid_pos?(end_pos)
        self[end_pos] = temp_piece
      else
        raise InvalidPosError
      end
    rescue NoPieceError => e #|| InvalidPosError => e
      puts e.message
    rescue InvalidPosError => e
      puts e.message
    end
  end

  def valid_pos?(pos)
    if pos[0].between?(0, 7) && pos[1].between?(0, 7)
      return true
    end
    false
  end

  def add_piece(piece, pos)
    case piece
    when :king
      King.new(@rows, pos, color)
    when :queen
      Queen.new(@rows, pos, color)
    when :bishop
    when :rook
    when :knight
    when :pawn
    end
  end

  def checkmate?(color)
  end

  def in_check?(color)

  end

  def find_king(color)

  end

  def pieces
    pieces = [:king, :queen, :bishop, :rook, :knight, :pawn]

  end

  def dup
  end

  def move_piece!(color, start_pos, end_pos)

  end
end

class NoPieceError < StandardError
  def message
    "No piece to move."
  end

end

class InvalidPosError < StandardError
  def message
    "Invalid Position"
  end
end
