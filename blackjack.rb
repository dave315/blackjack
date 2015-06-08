require 'pry'
require_relative 'game'
require_relative 'hand'
require_relative 'playercard'
require_relative 'deck'

game_deck = Deck.new
player_hand = Hand.new("Player")
house_hand = Hand.new("House")

game = Game.new(game_deck, player_hand, house_hand)

game.play_game
