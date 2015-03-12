require './piece'

class Chess
  attr_reader :pieces

  def initialize
    @pieces = setup_board
  end

  def setup_board
    pieces = []
    #Creating dark side
    pieces << Knight.new('dark',1,2) #B1
    pieces << Knight.new('dark',1,7) #G1
    pieces << Rook.new('dark',1,1) #A1
    pieces << Rook.new('dark',1,8) #H1
    pieces << Bishop.new('dark',1,3) #C1
    pieces << Bishop.new('dark',1,6) #F1
    pieces << Queen.new('dark',1,4) #D1
    pieces << King.new('dark',1,5) #E1
    (1..8).each {|num| pieces << Pawn.new('dark',2,num)} #A2-H2

    #Creating light side
    pieces << Knight.new('light',8,2) #B8
    pieces << Knight.new('light',8,7) #G8
    pieces << Rook.new('light',8,1) #A8
    pieces << Rook.new('light',8,8) #H8
    pieces << Bishop.new('light',8,3) #C8
    pieces << Bishop.new('light',8,6) #F8
    pieces << Queen.new('light',8,4) #D8
    pieces << King.new('light',8,5) #E8
    (1..8).each {|num| pieces << Pawn.new('light',7,num)} #A7-H7
    pieces
  end
end

class Board

  def initialize(chess_game)
    @pieces = chess_game.pieces
  end

  def print_nogui
    p '    A   B   C   D   E   F   G   H    '
    p '  +' + ('-' * 31) + '+  '
    create_board_row(8)
    create_board_row(7)
    create_board_row(6)
    create_board_row(5)
    create_board_row(4)
    create_board_row(3)
    create_board_row(2)
    create_board_row(1)
    p '  +' + ('-' * 31) + '+  '
    p '    A   B   C   D   E   F   G   H    '
  end

  def create_board_row(row)
    p "#{row} | " +
      populate_board_cell(row,1) + '   ' +
      populate_board_cell(row,2) + '   ' +
      populate_board_cell(row,3) + '   ' +
      populate_board_cell(row,4) + '   ' +
      populate_board_cell(row,5) + '   ' +
      populate_board_cell(row,6) + '   ' +
      populate_board_cell(row,7) + '   ' +
      populate_board_cell(row,8) +
      " | #{row}"
  end

  def populate_board_cell(row, column)
    piece = @pieces.find{|piece| piece.row == row && piece.column == column}
    if piece
      piece.to_s
    else
      ' '
    end
  end

end

tc = Chess.new
p tc.pieces
p "total: #{tc.pieces.size}"

board = Board.new(tc)
board.print_nogui
