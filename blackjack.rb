class Blackjack
  def initialize(number_of_players)
    @deck = Deck.new
    shuffle_deck
    @players = [Player.new(true, false)]
    (1..number_of_players).each {|player| @players << Player.new(false, false)}
  end

  def deck
    @deck
  end

  def play_round
    @players.each{|player| move(player) unless player.status == 'bust' }
  end

  def play_all_rounds
    play_round until @players.all?{|player| player.status == 'bust' || player.status == 'stuck'}
  end

  def end_game
    p 'Game finished'
    @players.each{|player| p 'score: ' + player.status.to_s }
  end

  def move(player)
    case player.take_turn
    when 'stick'
    when 'twist'
      player.twist(@deck.draw)
    end
  end

  def shuffle_deck
    @deck.shuffle
  end
end

class Deck
  def initialize
    @cards = []
    suits = ['spade','diamond','heart','club']
    suits.each {|suit|
      (1..13).each {|number| cards << Card.new(suit, number)}
      }
  end

  def draw
    @cards.pop or raise EmptyDeckException
  end

  def twist(card)
    @cards << card
  end

  def cards
    @cards
  end

  def size
    @cards.size
  end

  def shuffle
    @cards = @cards.shuffle
  end

  def show_cards
    card_list = []
    @cards.each {|card| card_list << card.suit.to_s + ';' + card.value.to_s}
    card_list
  end
end

class EmptyDeckException < Exception
end

class Card
  attr_reader :value

  def initialize(suit, value)
    @suit = suit
    @value = value.to_i
  end

  def suit
    @suit
  end
end

class Player
  attr_reader :status

  def initialize(is_house, is_human)
    @is_house = is_house
    @is_human = is_human
    @status = 'ingame'
    @hand = []
  end

  def stick
    @status = 'stuck'
  end

  def twist(card)
    @hand << card
  end

  def is_house?
    @is_house
  end

  def bust?
    @hand.inject(0){|sum,x|} >= 21
  end

  def take_turn
    if @is_human
      case gets
      when "Stick\n","stick\n","S\n","s\n"
        'stick'
      when "Twist\n","twist\n","T\n","t\n"
        'twist'
      else
        p "Couldn't interpret move"
      end
    else
      p 'hand: ' + @hand.to_s
      'twist' unless bust?
    end
  end
end

Blackjack.new(2)
