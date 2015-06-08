require_relative 'game'
require_relative 'hand'
require_relative 'playercard'
require_relative 'deck'

SUITS = ['♠','♥','♦','♣']
RANK = ['2', '3', '4', '5', '6', '7', '8', '9','10', 'J', 'Q', 'K', 'A']

class Deck
  def initialize
    @collection = []
    SUITS.each do |suit|
      RANK.each do |rank|
          @collection << PlayingCard.new(rank, suit)
      end
    end
    @collection.shuffle!
  end

  def deal!
    @collection.pop
  end

  def collection
    @collection
  end

end
