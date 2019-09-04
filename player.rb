require_relative 'deck-of-cards'
require_relative "the_dealer"
require "tty-prompt"
require "tty-font"
require "artii"
require "rainbow"

PROMPT = TTY::Prompt.new
FONT = TTY::Font.new(:standard)
PASTEL = Pastel.new
ARTII = Artii::Base.new :font => 'stop'

class Player < Dealer
    def initialize(name)
        @name = name
        @bank = 1000
        @deck = Deck.new
        @playerhand = 0 
        @player_bet = 0
        @outcomes = []
        @dealerhand = 0
        @instancecount = 0
    end
    

        def player_profile 
            begin
            puts "Howdy! What's your player name?"
            @name = gets.strip
                if @name.length > 10
                    raise 
                end
            rescue => error
                    puts "Sorry name length is too long. Please restric to 10 characters or less"
                    player_profile
            end
            start
        end

        def start
            puts "Howdy #{@name}"
            puts "#{@name}s bank: $#{@bank}"
            answer = PROMPT.select("What's your move?", %w(Deal Exit)) 
             if answer == "Deal"
                @instancecount += 1
                system "clear"
                starting_bet
             else answer == "Exit"
                p @outcomes
             end
        end

        def starting_bet
            puts "#{@name}s bank: $#{@bank}"
            player_bet = PROMPT.select("Place a bet", %w(10 100 200 500))
            @player_bet = player_bet.to_i
            if @player_bet > @bank
                puts "Insufficient funds: place a smaller bet"
                starting_bet
            end
            system "clear"
            the_deal
            

        end

        def the_deal
            puts "Players hand:"
            puts " ------------ "
            card1 = @deck.deal
            card2 = @deck.deal
            puts " ------------ "
            @playerhand = card1 + card2
            puts "Player Total = #{@playerhand}"
            player_hand
        end 

        def the_deal_two
            puts "Next card:"
            puts " ------------ "
            rank3 = @deck.deal
            puts " ------------ "
            @playerhand += rank3
            puts "Player Total = #{@playerhand}"
            player_hand
        end
        
        def player_hand
            if @playerhand == 21 
                blackjack
            elsif @playerhand > 21
                puts FONT.write("Bust!")
                outcome
            else @playerhand < 21
                player_move = PROMPT.select("What's your move?", %w(Hit Stand))
                if player_move == "Hit"
                    the_deal_two
                else player_move == "Stand"
                    dealer_hand
                end
            end
        end

        def blackjack
            puts FONT.write("Blackjack!").blink
            @bank += @player_bet * 2 
            p @bank
            start
        end

        def outcome
            if  @playerhand < @dealerhand || @playerhand > 21
                puts "Dealer wins!"
                p  @dealerhand
                p  @playerhand
                @bank -= @player_bet
            elsif
                @playerhand > @dealerhand 
                puts Font.write("Player wins!").blink
                @bank += @player_bet * 1.5
            else @playerhand == @dealerhand
                puts "Even Steven! No Winner."
            end
            history
        end

        def history
            history = { :round => @instancecount, :bet => @player_bet, :bank => @bank }
            @outcomes << history
            start
        end

end


# puts PASTEL.yellow(FONT.write('Blackjack lite'))
# puts "Howdy Partner!"

puts "                                 "
puts "                                 "
puts ARTII.asciify('---------------------------').colorize(:red).on_white
puts ARTII.asciify('BLACK JACK   LITE').colorize(:black).on_white 
puts ARTII.asciify('---------------------------').colorize(:red).on_white
puts "                                 "
puts "                                 "

player_01 = Player.new("Izzy")
player_01.player_profile


