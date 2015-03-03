class Chess
end

class Piece
  def can_move
    positions.size = 0 && not_in_check?
  end

  def forward
    [1,0]
  end

  def backward
    [-1,0]
  end

  def left
    [0,1]
  end

  def right
    [0,-1]
  end

end

class Knight < Piece
  def position
    ["A5","B6"]
  end

  def jump
    [3,2] # or use Piece methods?
end

class Board
  def initialize
    spaces = {}
    (1..8).each{|column| (1..8).each{|row| spaces[[column,row]]}}
  end

  def add_pieces
    spaces[[0,5]] = Knight.new
  end

  def print_space space
    column_key = ["A","B","C","D","E","F","G","H"]
    p column_key.get(space.column).to_s + ' ' + space.row.to_s
  end

end
