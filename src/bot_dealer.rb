# frozen_string_literal: true

require_relative 'deck_of_cards'
# the bot dealer, containing their parameters
class Dealer
  def initialize
    @card1 = 0
    @card2 = 0
  end

  def dealer_hand
    begin
    puts 'Dealers hand:'.colorize(:blue).underline
    puts ' ------------ '
    @card1 = @deck.deal
    @card2 = @deck.deal
    rescue StandardError => e
    puts 'END OF DECK: RESHUFFLING!'
    @deck = Deck.new
    start
    end
    puts ' ------------ '
    sum_dealer_hand
  end

  def sum_dealer_hand
    @dealerhand = @card1 + @card2
    if @card1 == 11
      ace_value_card1
    elsif @card2 == 11
      ace_value_card2
    else
      puts "Dealers total = #{@dealerhand}"
      dealer_play
    end
  end

  def ace_value_card1
    if @card1 == 11 && @dealerhand > 10 && @dealerhand != 21
      @card1 = 1
    @dealerhand = @card1 + @card2
    puts "Dealers total = #{@dealerhand}"
    dealer_play
   end
end

  def ace_value_card2
    if @card2 == 11 && @dealerhand > 10 && @dealerhand != 21
      @card2 = 1
      @dealerhand = @card1 + @card2
    end
    puts "Dealers total = #{@dealerhand}"
    dealer_play
  end

  def dealer_hit
    begin
    card = @deck.deal
    rescue StandardError => e
    puts 'END OF DECK: RESHUFFLING!'
    @deck = Deck.new
    start
    end
    @dealerhand += card
    puts "Dealers total = #{@dealerhand}"
    dealer_play
  end

  def dealer_play
    if @dealerhand == 21
      outcome
    elsif @dealerhand <= 16
      dealer_hit
    elsif @dealerhand >= 17 && @dealerhand < 21
      outcome
    else
        unless ARGV.empty?
            puts "Yee-Haw partner! We havin' a hog-killin time!".colorize(:yellow)
          end
      puts FONT.write('Dealer bust!')
      @bank += @player_bet * 1.5
      history
    end
  end
end
