require_relative 'deck-of-cards'
# require_relative 'the_dealer'
require "tty-prompt"

PROMPT = TTY::Prompt.new


class Player
    def initialize(name)
        @name = name
        @bank = 1000
        @deck = Deck.new
        @dealerhand = 0
        @playerhand = 0 
        @player_bet = 0
        @outcomes = []
    end
    

        def start 
            puts "Howdy, Player01!"
            answer = PROMPT.select("What's your move?", %w(Deal Exit)) 
             if answer == "Deal"
                starting_bet
             end
        end

        def starting_bet
            puts "Place bet"
            player_bet = PROMPT.select("Place a bet", %w(10 100 200 500))
            @player_bet = player_bet.to_i
            if @player_bet > @bank
                puts "Insufficient funds: place a smaller bet"
                starting_bet
            end
            the_deal
            

        end

        def the_deal
            card1 = @deck.deal
            card2 = @deck.deal
            @playerhand = card1 + card2
            player_hand
        end 

        def the_deal_two
            rank3 = @deck.deal
            @playerhand += rank3
            player_hand
        end
        
        def player_hand
            if @playerhand == 21
                blackjack
            elsif @playerhand > 21
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

        def dealer_hand
            rank1 = @deck.deal
            rank2 = @deck.deal
            @dealerhand = rank1 + rank2
            # puts "playerhand #{@playerhand}"
            # puts "dealerhand #{@dealerhand}"
            dealer_play
        end
        
        def dealer_hand_two
            card = @deck.deal
            @dealerhand += card
            if @dealerhand < 16
                dealer_hand_two
            else @dealerhand > 17 
                outcome
            end
        end
        
        def dealer_play
            if @dealerhand == 21
                puts "You lose!"
                outcome
            elsif @dealerhand < 16
                dealer_hand_two
            else @dealerhand > 17 
                outcome
            end
        end

        def blackjack
            puts "Blackjack!"
            @bank += @player_bet *2
            start
        end

        def outcome
            if  @playerhand < @dealerhand || @playerhand > 21
                puts "Dealer wins!"
                @bank -= @player_bet
            elsif
                @playerhand > @dealerhand 
                puts "Player wins!"
                @bank += @player_bet * 1.5
            else @playerhand == @dealerhand
                puts "Even Steven! No Winner."
            end
            start
        end

        # def blackjack_win
        #     winnings = @player_bet * 2
        #     p winnings
        #     @bank += winnings
        #     puts "Yay your bank is now #{@bank}"
        #     blackjackwin = "Black #{winnings}"
        #     @outcomes << blackjackwin
        #     start
        # end

        # def round_win
        #     puts "Player wins!"
        #     winnings = @player_bet * 1.5
        #     @bank += winnings
        #     puts "Yay your bank is now #{@bank}"
        #     better_wins = "Won #{winnings}"
        #     @outcomes << better_wins
        #     start
        # end

        # def round_loss
        #     puts "Dealer wins!"
        #     losses = @player_bet
        #     puts losses
        #     @bank -= losses
        #     puts "Your bank is now #{@bank}"
        #     better_losses = "Lost #{losses}"
        #     @outcomes << better_losses
        #     start
        # end

        # def comparison
        #     if @playerhand > @dealerhand
        #         round_win
        #     elsif @playerhand < @dealerhand
        #         round_loss
        #     else 
        #     end
        # end
end




player_01 = Player.new("Izzy")
player_01.start


