require 'colorize'

class Card

 
  def initialize(rank, suit)
    @rank = rank
    @suit = suit
    
  end
 
  def deal_card
    if @suit == '♥' || @suit == '♦'
      puts "#{@rank}".colorize(:red).on_white + " #{@suit}".colorize(:red).on_white
      if @rank == "K" || @rank == "Q" || @rank == "J"
        @rank = 10
      elsif @rank == "A"
        @rank = 11
      else
      end
      return @rank
    else @suit == '♣' || @suit == '♠'
      puts "#{@rank}".colorize(:black).on_white + " #{@suit}".colorize(:black).on_white
      if @rank == "K" || @rank == "Q" || @rank == "J"
        @rank = 10
      elsif @rank == "A"
        @rank = 11
      else
      end
      return @rank
    end
  end
 
end
 
class Deck
  def initialize
    @ranks = [*(2..10), 'J', 'Q', 'K', 'A']
    @suits = ['♣', '♥', '♠', '♦']
    @cards = []
 
    @ranks.each do |rank|
      @suits.each do |suit|
        @cards << Card.new(rank, suit)
      end
    end
  
  @cards.shuffle!
  end
 
  def deal
    @cards.shift.deal_card
  end
end
 






