require_relative 'deck_of_cards'
require_relative "bot_dealer"
require "tty-prompt"
require "tty-font"
require "artii"
require "rainbow"
require "colorize"

PROMPT = TTY::Prompt.new
FONT = TTY::Font.new(:standard)
PASTEL = Pastel.new
ARTII = Artii::Base.new :font => 'small'

class Player < Dealer
    def initialize
        @name = " "
        @bank = 1000
        @deck = Deck.new
        @playerhand = 0 
        @player_bet = 0
        @outcomes = []
        @dealerhand = 0
        @instancecount = 0
        @hand = []
        @card1 = 0
        @card2 = 0
        @card3 = 0
    end

    
    
    def player_profile 
        begin
        puts "Howdy! What's your player name?"
        @name = STDIN.gets.strip
            if @name.length > 10
                raise 
            end
        rescue => error
                puts "Sorry name length is too long. Please restrict to 10 characters or less"
                player_profile
        end
        if ARGV.length > 0
            hank
        end
        start
    end

    def start
        puts "Howdy #{@name}"
        begin
        puts "#{@name}s bank: $#{@bank}"
            if @bank < 10
                raise
            end
        rescue => error
            puts "uh-oh! Looks like your bank account is less than $10"
            puts "Remember to gamble responsibly!"
            puts PROMPT.keypress("Bank account will reset in :countdown ...", timeout: 60)
            @bank = 1000
        end
            
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
        puts "Players hand:".underline
        puts " ------------ "
        @card1 = @deck.deal
        @card2 = @deck.deal
        puts " ------------ "
            if @card1 == 11
                ace_value_one
            elsif @card2 == 11
                ace_value_two
            else
                calculation_of_hand
            end
    end

    def calculation_of_hand
        @hand << @card1
        @hand << @card2
        begin
        @playerhand = @card1 + @card2
            if @card1 == nil || @card2 == nil
                raise
            end
        rescue => error
            puts "END OF DECK: RESHUFFLING!"
            @deck = Deck.new
            start
        end
        puts "Player Total = #{@playerhand}"
        if ARGV.length > 0 
            show_hint
        end
        player_hand
    end 

    def ace_value_one
        ace_option = PROMPT.select("What does your ace equal?", %w(1 11))
        case ace_option
        when '1' 
            @card1 = 1
        else '11' 
            @card1 = 11
        end
        calculation_of_hand
    end

    def ace_value_two
        ace_option = PROMPT.select("What does your ace equal?", %w(1 11))
        case ace_option
        when '1' 
            @card2 = 1
        else '11' 
            @card2 = 11
        end
        calculation_of_hand
    end

    def ace_value_three
        ace_option = PROMPT.select("What does your ace equal?", %w(1 11))
        case ace_option
        when '1' 
            @card3 = 1
        else '11' 
            @card3 = 11
        end
        calculation_of_hand_two
    end

    def player_hand
        if @playerhand == 21 && @hand.length == 2
            blackjack
        elsif @playerhand > 21
            puts FONT.write("Bust!")
            outcome
        else @playerhand < 21
            player_move = PROMPT.select("What's your move?", %w(Hit Stand))
            if player_move == "Hit"
                player_hit
            else player_move == "Stand"
                dealer_hand
            end
        end
    end

    def player_hit
        puts "Next card:"
        puts " ------------ "
        @card3 = @deck.deal
        puts " ------------ "
            if @card3 == 11
                ace_value_three
                # ace_option = PROMPT.select("What does your ace equal?", %w(1 11))
                # if ace_option == '1'
                #     rank3 = 1
                # else ace_option == '11'
                #     rank3 = 11
                # end
            end
        calculation_of_hand_two
     end

    def calculation_of_hand_two
        @hand.push(@card3)
        begin
        @playerhand += @card3
            if @card3 == nil
                raise
            end
        rescue => error
            puts "END OF DECK: RESHUFFLING!"
            @deck = Deck.new
            start
        end
        puts "Player Total = #{@playerhand}"
        if ARGV.length > 0 && @playerhand < 21
            show_hint
        end
        player_hand
    end

    def blackjack
        if ARGV.length > 0
            puts "YEE-HAW! Partner! You as good as me, Hank!".colorize(:yellow)
        end
        puts FONT.write("Blackjack!").blink
        @bank += @player_bet * 2 
        history
    end

    def outcome
        if  @playerhand < @dealerhand || @playerhand > 21
            if ARGV.length > 0
                puts "Oh-no partner! You barkin' at a knot!".colorize(:yellow)
            end
            puts FONT.write("Dealer wins!")
            @bank -= @player_bet
        elsif
            @playerhand > @dealerhand 
            if ARGV.length > 0
                puts "Yee-Haw partner! We havin' a hog-killin time!".colorize(:yellow)
            end
            puts FONT.write("Player wins!")
            @bank += @player_bet * 1.5
        else @playerhand == @dealerhand
            if ARGV.length > 0
                puts "Looks like that hand was between hay and grass!".colorize(:yellow)
            end
            puts FONT.write("Draw!")
        end
        history
    end

    def history
        history = { :round => @instancecount, :bet => @player_bet, :bank => @bank }
        @outcomes << history
        PROMPT.keypress("Reshuffling cards. Next round will start in :countdown ...", timeout: 3)
        @hand = []
        start
    end

    def hank 
        system "clear"
        puts "Howdy partner!".colorize(:yellow).underline
        puts "Hank's my name and blackjack's my game"
        puts "Throughout the game I'll be here to give ya some red hot hints!"
        puts "And remember to gamble responsibly!"
        puts "YEE-HAW!".colorize(:yellow)
        start
    end

    def show_hint
        if @playerhand > 16 && @playerhand < 21
            puts "Hank thinks y'all should Stand!".colorize(:yellow).bold
        else @playerhand < 16
            puts "Hank thinks y'all should Hit!".colorize(:yellow).bold
        end
        player_hand
    end

end


puts "                                 "
puts "                                 "
puts '♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦'.colorize(:red)
puts ARTII.asciify("   "'BLACK JACK   LITE      ').colorize(:black).on_white
puts '♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦ ♣ ♥ ♠ ♦'.colorize(:red)
puts "                                 "
puts "                                 "

player_01 = Player.new
player_01.player_profile
