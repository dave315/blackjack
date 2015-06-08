require_relative 'game'
require_relative 'hand'
require_relative 'playercard'
require_relative 'deck'

class Game
  attr_reader :game_deck
  attr_accessor :player_hand, :dealer_hand
  def initialize(game_deck, player_hand, dealer_hand)
    @game_deck = game_deck
    @player_hand = player_hand
    @dealer_hand = dealer_hand
  end

  def deal_card_to_player(game_deck, player_or_dealer)
    card = game_deck.deal!
    player_or_dealer.hand_array << card
    puts "#{player_or_dealer.name} was dealt the #{card.rank}#{card.suit}"
  end

  def player_plays_game
    2.times do
      deal_card_to_player(game_deck, player_hand)
    end

    until player_hand.valuation >= 21
     puts "Player has #{player_hand.valuation}"
     puts "Select Hit or Stand (h/s)"
     player_selection = gets.chomp

       if player_selection == "h"
         deal_card_to_player(game_deck, player_hand)
       elsif player_selection == "s"
         puts "Player score: #{player_hand.valuation}"
         break
       end
     end
  end

  def house_plays_game
    2.times do
      deal_card_to_player(game_deck, dealer_hand)
    end
    until dealer_hand.valuation >= 17
      deal_card_to_player(game_deck, dealer_hand)
    end
    if dealer_hand.bust?
      puts "Dealer, Busted!"
    end
  end

  def score_checker
    unless dealer_hand.bust?
      if player_hand.valuation > dealer_hand.valuation
        puts "Player wins!"
      elsif player_hand.valuation < dealer_hand.valuation
        puts "Dealer has #{dealer_hand.valuation}: Dealer wins!"
      elsif player_hand.blackjack? && dealer_hand.blackjack?
        puts "You both have Blackjack! Push"
      elsif player_hand.blackjack? && (dealer_hand.blackjack? == false)
        puts "You got Blackjack! Big pay out!...of nothing"
      else
        puts "push"
      end
    else
      puts "Player Wins!"
    end
  end

  def score_printer
    puts "The player had #{player_hand.valuation} and the House had #{dealer_hand.valuation}"
  end

  def round
    player_plays_game
      if player_hand.bust?
        puts "Busted! Game over, you fool"
        return idiot_method
      end
    house_plays_game
    score_printer
    score_checker
    idiot_method
  end

  def hand_reset
    player_hand.hand_array = []
    dealer_hand.hand_array = []
  end

  def idiot_method
    puts "Want to play again? (y/n)"
    input = gets.chomp
    if input == "y"
      hand_reset
      round
    elsif input == "n"
      puts "Thanks for playing! Goodbye!"
    else
       puts "Select y or n... seriously... c'mon..."
       idiot_method
    end
  end

  def play_game
    puts "Welcome to Blackjack...kinda"
    round
  end

end
