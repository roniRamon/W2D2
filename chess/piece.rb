class Piece

  def initialize(board, pos, color)
    @color = color
    @board = board
    @pos = pos
  end

  def moves
    []
  end

  def to_s
  end

  def empty?(position)
    @board[position] == NullPiece.instance
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

  def moves
    moves = []

    if move_dirs == :horiz
      horizontal_dirs.each do |dir|
        moves += grow_unblocked_moves_in_dir(dir[0],dir[1])
      end
    elsif move_dirs == :diag
      diagonal_dirs.each do |dir|
        moves += grow_unblocked_moves_in_dir(dir[0],dir[1])
      end
    elsif move_dirs == [:diag, :horiz]
      both = diagonal_dirs + horizontal_dirs
      both.each do |dir|
        moves += grow_unblocked_moves_in_dir(dir[0],dir[1])
      end
    end
    moves
  end

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  private

  def grow_unblocked_moves_in_dir(dx, dy)
    possible_moves = []
    x, y = @pos[0] + dx, @pos[1] + dy
    while x.between?(0, 6) && y.between?(0, 6) && empty?([x, y])
      x += dx
      y += dy
      possible_moves << [x, y]
    end

    possible_moves
  end

  HORIZONTAL_DIRS = [[0, 1], [1, 0], [-1, 0], [0, -1]]
  DIAGONAL_DIRS = [[1, 1], [-1, -1], [-1, 1], [1, -1]]

  def move_dirs
    [:diag, :horiz]
  end

end

module SteppingPiece
  def moves
    possible_moves = []
    move_diffs.each do |dir|
      next_move = [@pos[0] + dir[0], @pos[1] + dir[1]]
      if next_move[0].between?(0, 7) && next_move[1].between?(0, 7)
        if empty?(next_move)
          possible_moves << next_move
        end
      end
    end
    possible_moves
  end

  private

  def move_diffs
    king = [[0, 1], [1, 0], [-1, 0], [0, -1], [1, 1], [-1, -1], [-1, 1], [1, -1]]
    knight = [[1, -2], [1, 2], [2, 1], [2, -1], [-1, -2], [-2, -1], [-1, 2], [-2, 1]]
  end
end
