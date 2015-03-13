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
    (1..8).each {|num| create_board_row(9 - num)}
    p '  +' + ('-' * 31) + '+  '
    p '    A   B   C   D   E   F   G   H    '
    p (' ' * 37)
    print_removed_pieces
  end

  def print_removed_pieces
    removed_pieces = @pieces.find{|piece| piece.row == -1 && piece.column == -1}
    removed_pieces.each {|piece| p piece.to_s } unless removed_pieces.nil?
  end

  def create_board_row(row)
    out = "#{row} | "
    (1..7).each {|num| out += populate_board_cell(row,num) + '   ' }
    out += populate_board_cell(row, 8)
    out += " | #{row}"
    out
    p out
  end

  def populate_board_cell(row, column)
    piece = @pieces.find{|piece| piece.row == row && piece.column == column}
    if piece
      piece.to_s
    else
      ' '
    end
  end

  def remove_piece(piece)
    piece.remove_from_board
  end

end

tc = Chess.new
p tc.pieces
p "total: #{tc.pieces.size}"
pawn1 = tc.pieces.find{|piece| piece.row == 2 && piece.column == 1}
pawn1.up
pawn1.right
pawn2 = tc.pieces.find{|piece| piece.row == 7 && piece.column == 4}
pawn2.down
pawn2.down
pawn3 = tc.pieces.find{|piece| piece.row == 2 && piece.column == 4}
pawn3.up
pawn3.up

board = Board.new(tc)
board.print_nogui
