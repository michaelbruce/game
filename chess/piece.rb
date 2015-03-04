class Piece
  attr_reader :alignment

  def set_position(row,column)
    @row = row
    @column = column
  end

  def initialize(alignment, row, column)
    @alignment = alignment
    set_position(row,column)
  end


  def forward
    raise OffBoardMove, "this move would take the piece of the board" if @column = 8
    @column += 1
  end

  def backward
    raise OffBoardMove, "this move would take the piece of the board" if @column = 1
    @column -= 1
  end

  def left
    raise OffBoardMove, "this move would take the piece of the board" if @row = 1
    @row -= 1
  end

  def right
    raise OffBoardMove, "this move would take the piece of the board" if @row = 8
    @row += 1
  end
end

class Knight < Piece
  def position
    ["A5","B6"]
  end

  def jump
    [3,2] # or use Piece methods?
  end
end
