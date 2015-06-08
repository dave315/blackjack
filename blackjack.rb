#!/usr/bin/env ruby
class PlayingCard

  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def ace?
    @rank == 'A'
  end

  def face_card?
    ['J', 'Q', 'K'].include?(@rank)
  end

end

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
