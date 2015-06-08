require_relative 'game'
require_relative 'hand'
require_relative 'playercard'
require_relative 'deck'

class PlayingCard
  attr_reader :rank, :suit, :value
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

  def value
    if ace?
      [11, 1]
    elsif face_card?
      10
    else
      rank.to_i
    end
  end
end
