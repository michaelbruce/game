require 'rspec'
require_relative '../blackjack'

describe Blackjack do
  it 'should create a full 52 deck of cards' do
    game = Blackjack.new
    expect(game.deck.size).to eq(52)
  end

  it 'remove a single card from the deck when drawn' do
    game = Blackjack.new
    game.deck.draw
    expect(game.deck.size).to eq(51)
  end

  it 'raises an EmptyDeckException when there are no cards left to draw' do
    game = Blackjack.new
    (1..52).each {game.deck.draw}
    expect{game.deck.draw}.to raise_error(EmptyDeckException)
  end

  skip 'shuffles the deck before the game begins' do
    pending('not sure how to test for random order')
    #game = Blackjack.new
    #expect(game.deck.show_cards).not_to eq(Deck.new.show_cards)
  end
end
