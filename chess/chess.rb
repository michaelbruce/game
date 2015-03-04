class Chess
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
