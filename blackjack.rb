class Blackjack
  def initialize
    @deck = Deck.new
    shuffle_deck
  end

  def deck
    @deck
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
    @cards.each {|card| card_list << card.suit.to_s + card.value.to_s}
    card_list
  end
end

class EmptyDeckException < Exception
end

class Card
  def initialize(suit, value)
    @suit = suit
    @value = value
  end

  def suit
    @suit
  end

  def value
    @value
  end
end

