require './piece'

class Chess
  attr_reader :pieces

  def initialize
    @pieces = setup_board
  end

  def setup_board
    pieces = []
    #Creating dark side
    pieces << Knight.new('dark',2,1) #B1
    pieces << Knight.new('dark',7,1) #G1
    pieces << Rook.new('dark',1,1) #A1
    pieces << Rook.new('dark',8,1) #H1
    pieces << Bishop.new('dark',3,1) #C1
    pieces << Bishop.new('dark',6,1) #F1
    pieces << Queen.new('dark',4,1) #D1
    pieces << King.new('dark',5,1) #E1
    (1..8).each {|num| pieces << Pawn.new('dark', num, 2)} #A2-H2

    #Creating light side
    pieces << Knight.new('light',2,8) #B8
    pieces << Knight.new('light',7,8) #G8
    pieces << Rook.new('light',1,8) #A8
    pieces << Rook.new('light',8,8) #H8
    pieces << Bishop.new('light',3,8) #C8
    pieces << Bishop.new('light',6,8) #F8
    pieces << Queen.new('light',4,8) #D8
    pieces << King.new('light',5,8) #E8
    (1..8).each {|num| pieces << Pawn.new('light', num, 7)} #A7-H7
    pieces
  end
end

class Board

  def initialize
    print_nogui
  end

  def print_nogui
    p '    A   B   C   D   E   F   G   H    '
    p '  +' + ('-' * 31) + '+  '
    p '8 |' + (' ' * 31) + '| 8'
    p '7 |' + (' ' * 31) + '| 7'
    p '6 |' + (' ' * 31) + '| 6'
    p '5 |' + (' ' * 31) + '| 5'
    p '4 |' + (' ' * 31) + '| 4'
    p '3 |' + (' ' * 31) + '| 3'
    p '2 |' + (' ' * 31) + '| 2'
    p '1 |' + (' ' * 31) + '| 1'
    p '  +' + ('-' * 31) + '+  '
    p '    A   B   C   D   E   F   G   H    '
  end

  def create_board_row
    p '8 |' + (' ' * 31) + '| 8'
  end

  def populate_board_cell(row, column)
    pieces.each{|piece| piece.row == row && piece.column == column}
  end

  #def initialize
  #  spaces = {}
  #  (1..8).each{|column| (1..8).each{|row| spaces[[column,row]]}}
  #end

  #def add_pieces
  #  spaces[[0,5]] = Knight.new
  #end

  #def print_space space
  #  column_key = ["A","B","C","D","E","F","G","H"]
  #  p column_key.get(space.column).to_s + ' ' + space.row.to_s
  #end

end

tc = Chess.new
p tc.pieces
p "total: #{tc.pieces.size}"

board = Board.new
