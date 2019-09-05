# frozen_string_literal: true

require 'colorize'
# This class is to create a new card combining the suit and rank to print out to the user in respective colours
class Card
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
  end

  def deal_card
    if @suit == '♥' || @suit == '♦'
      puts @rank.to_s.colorize(:red).on_white + " #{@suit}".colorize(:red).on_white
      if @rank == 'K' || @rank == 'Q' || @rank == 'J'
        @rank = 10
      elsif @rank == 'A'
        @rank = 11
      end
       @rank
    else @suit == '♣' || @suit == '♠'
         puts @rank.to_s.colorize(:black).on_white + " #{@suit}".colorize(:black).on_white
         if @rank == 'K' || @rank == 'Q' || @rank == 'J'
           @rank = 10
         elsif @rank == 'A'
           @rank = 11
         end
         @rank
    end
  end
end

# this class is to create a 52 card deck by itterating through the ranks array and pairing with each suit
# It shuffles the deck and pulls a card from the deck
class Deck 
  def initialize
    @ranks = [*(2..10), 'J', 'Q', 'K', 'A']
    @suits = ['♣', '♥', '♠', '♦']
    @new_deck = []
    @ranks.each do |rank|
      @suits.each do |suit|
        @new_deck << Card.new(rank, suit)
      end
    end
    @new_deck.shuffle!
  end

  def deal
  
    @new_deck.shift.deal_card
  
  end
end

