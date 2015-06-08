require_relative 'game'
require_relative 'hand'
require_relative 'playercard'
require_relative 'deck'

class Hand
  attr_reader :name
  attr_accessor :hand_array, :hand_value
  def initialize (name, hand_array = [])
    @name = name
    @hand_array = hand_array
    @hand_value = 0
  end

  def blackjack?
    if hand_array.length == 2

      #if the first card is ace >> and second is face card = blackjack
      if hand_array.first.ace?
        if hand_array.last.face_card? || hand_array.last.rank == "10"
          return true
        end
      end

      if hand_array.first.face_card? || hand_array.first.rank == "10"
        if hand_array.last.ace?
          return true
        end
      end
      false
    end
  end

  def valuation
    @hand_value = 0
    ace_sort.each do |card|
      if card.ace?
        if ((card.value)[0] + @hand_value) > 21
          @hand_value += (card.value)[1]
        else
          @hand_value += (card.value)[0]
        end
      else
        @hand_value += card.value
      end
    end

    @hand_value
  end

  def ace_sort
    binding.pry
    hand_array.each do |card|
      if card.ace?
        ace = hand_array.delete(card)
        hand_array.insert(-1, ace)
      end
    end
    hand_array
  end

  def bust?
    valuation > 21
  end

end
