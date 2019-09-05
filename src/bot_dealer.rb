# frozen_string_literal: true

require_relative 'deck_of_cards'
class Dealer
    def initialize 
        @card1 = 0
        @card2 = 0
    end
  
  def dealer_hand
    puts 'Dealers hand:'.colorize(:blue).underline
    puts ' ------------ '
    @card1 = @deck.deal
    @card2 = @deck.deal
    puts ' ------------ '
    @dealerhand = @card1 + @card2
    if @card1 == 11 || @card2 == 11
        dealer_ace_value
    else 
        puts "Dealers total = #{@dealerhand}"
        dealer_play
    end
  end

  def dealer_ace_value
        if @card1 == 11 && @dealerhand > 10 && @dealerhand != 21
        @card1 = 1
        @dealerhand = @card1 + @card2
        end
       if @card2 == 11 && @dealerhand > 10 && @dealerhand != 21
        @card2 = 1
        @dealerhand = @card1 + @card2
        end
      puts "Dealers total = #{@dealerhand}"
      dealer_play
    end


  def dealer_hit
    card = @deck.deal
    @dealerhand += card
    puts "Dealers total = #{@dealerhand}"
    dealer_play
  end

  def dealer_play
    if @dealerhand == 21
      puts 'You lose!'
      outcome
    elsif @dealerhand <= 16
      dealer_hit
    elsif @dealerhand >= 17 && @dealerhand < 21
      outcome
    else @dealerhand > 21
         puts 'Dealer bust!'
         @bank += @player_bet * 1.5
         history
    end
  end
end
