class Piece

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def moves
    []
  end

  def to_s
  end

  def empty?
    @pos.nil?
  end

  def valid_moves
  end

  def pos=(val)
    @pos = val
  end

  def symbol
  end

  private

  def move_into_check?(end_pos)
  end

end

module SlidingPiece

  def horizontal_dirs
    x, y = @pos
    (0..7).each do |i|
      next if [x,i] == @pos || [i,y] ==   @pos
      horizontal_dirs << [x,i]
      horizontal_dirs << [i,y]
    end
  end

  def diagonal_dirs
    x, y = @pos
    (1..7).each do |i|
      diagonal_dirs << [x + i, y + i]
      diagonal_dirs << [x - i, y - i]
      diagonal_dirs << [x + i, y - i]
      diagonal_dirs << [x - i, y + i]
    end
    diagonal_dirs.select { |el| el[0].between?(0,7) && el[1].between?(0,7)}
  end

  def moves
    horizontal_dirs || diagonal_dirs
  end

  private

  horizontal_dirs = []
  diagonal_dirs = []

  def move_dirs
    [:left, :right, :up, :down]
  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end
end

module SteppingPiece
  def moves
    possible_moves = []
    x, y = @pos

    (x - 1..x + 1).each do |row|
      (y - 1..y + 1).each do |col|
        next if !row.between?(0,7) || !col.between?(0,7)
        possible_moves << [row,col] unless row == x && col == y
      end
    end
    possible_moves
  end

  private

  def move_diffs

  end
end
