class Piece
  attr_reader :alignment, :row, :column

  def set_position(row,column)
    @row = row
    @column = column
  end

  def initialize(alignment, row, column)
    @alignment = alignment
    set_position(row,column)
  end

  def to_s
    "-"
  end

  def forward
    raise OffBoardMove, "this move would take the piece of the board" if @column == 8
    @column += 1
  end

  def backward
    raise OffBoardMove, "this move would take the piece of the board" if @column == 1
    @column -= 1
  end

  def left
    raise OffBoardMove, "this move would take the piece of the board" if @row == 1
    @row -= 1
  end

  def right
    raise OffBoardMove, "this move would take the piece of the board" if @row == 8
    @row += 1
  end
end

class String
  def colorize(color_code)
    "\033[1;#{color_code};40m#{self}\e[0m"
  end
end


class Knight < Piece
  def position
    ["A5","B6"]
  end

  def jump
    [3,2] # or use Piece methods?
  end

  def to_s
    @alignment == 'dark' ? "K" : "k"
  end
end

class Rook < Piece
  def position
    ["A5","B6"]
  end

  def jump
    [3,2] # or use Piece methods?
  end

  def to_s
    @alignment == 'dark' ? "R" : "r"
  end
end

class Bishop < Piece
  def position
    ["A5","B6"]
  end

  def jump
    [3,2] # or use Piece methods?
  end

  def to_s
    @alignment == 'dark' ? "B" : "b"
  end
end

class Queen < Piece
  def position
    ["A5","B6"]
  end

  def jump
    [3,2] # or use Piece methods?
  end

  def to_s
    @alignment == 'dark' ? "Q" : "q"
  end
end

class King < Piece
  def position
    ["A5","B6"]
  end

  def jump
    [3,2] # or use Piece methods?
  end

  def to_s
    @alignment == 'dark' ? "K" : "k"
  end
end

class Pawn < Piece
  def position
    ["A5","B6"]
  end

  def jump
    [3,2] # or use Piece methods?
  end

  def to_s
    #@alignment == 'dark' ? "p".colorize(31) : "p"
    @alignment == 'dark' ? "P" : "p"
  end
end
