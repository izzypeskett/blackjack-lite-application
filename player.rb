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
        @hand = []
    end

    def show_hint
        if @playerhand > 16
            puts "Hank thinks y'all should Stand!"
        else @playerhand < 16
            puts "Hank thinks y'all should Hit!"
        end
        player_hand
    end
    
    def player_profile 
        begin
        puts "Howdy! What's your player name?"
        @name = STDIN.gets.strip
            if @name.length > 10
                raise 
            end
        rescue StandardError => se
            puts se.backtrace
                puts "Sorry name length is too long. Please restrict to 10 characters or less"
                # player_profile
        end
        # if ARGV[0] == '--hint' 
        if ARGV.length > 0
            system "clear"
            puts "Howdy partner! Hank's my name and blackjack's my game"
            puts "Throughout the game I'll be here to give ya some red hot hints!"
            puts "And remember to gamble responsibly!"
            puts "YEE-HAW!".colorize(:yellow)

        end
        start

    end
    
    # def hank 
    #     if ARGV.length > 0
    #         puts "Howdy partner! Hank's my name and blackjack's my game"
    #         puts "Throughout the game I'll be here to give ya some red hot hints!"
    #         puts "And remember to gamble responsibly! Yee-Haw!"
    # end

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
        puts "Players hand:"
        puts " ------------ "
        card1 = @deck.deal
        card2 = @deck.deal
        puts " ------------ "
            if card1 == 11
                ace_option = PROMPT.select("What does your ace equal?", %w(1 11))
                if ace_option == '1'
                    card1 = 1
                else ace_option == '11'
                    card1 = 11
                end
            else
            end
            if card2 == 11
                ace_option = PROMPT.select("What does your ace equal?", %w(1 11))
                if ace_option == '1'
                    card2 = 1
                else ace_option == '11'
                    card2 = 11
                end
            else
            end
        @hand << card1
        @hand << card2
        @playerhand = card1 + card2
        puts "Player Total = #{@playerhand}"
        if ARGV.length > 0
            show_hint
        end
        player_hand
    end 

    def the_deal_two
        puts "Next card:"
        puts " ------------ "
        rank3 = @deck.deal
        puts " ------------ "
            if rank3 == 11
                ace_option = PROMPT.select("What does your ace equal?", %w(1 11))
                if ace_option == '1'
                    rank3 = 1
                else ace_option == '11'
                    rank3 = 11
                end
            else
            end
        @hand.push(rank3)
        @playerhand += rank3
        puts "Player Total = #{@playerhand}"
        player_hand
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
        history
    end

    def outcome
        if  @playerhand < @dealerhand || @playerhand > 21
            puts "Dealer wins!"
            @bank -= @player_bet
        elsif
            @playerhand > @dealerhand 
            puts FONT.write("Player wins!").blink
            @bank += @player_bet * 1.5
        else @playerhand == @dealerhand
            puts "Even Steven! No Winner."
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

end


puts "                                 "
puts "                                 "
puts ARTII.asciify('---------------------------').colorize(:red).on_white
puts ARTII.asciify('BLACK JACK   LITE').colorize(:black).on_white 
puts ARTII.asciify('---------------------------').colorize(:red).on_white
puts "                                 "
puts "                                 "

player_01 = Player.new("Izzy")
player_01.player_profile
