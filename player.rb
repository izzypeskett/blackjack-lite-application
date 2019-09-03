require_relative 'deck-of-cards'
# require_relative 'the_dealer'


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
            print "> Deal"
            print "> or"
            print "> Exit"
            answer = gets.strip
            if answer == "Deal"
                starting_bet
            else answer == "Exit"
                return
            end
        end

        def starting_bet
            puts "Place bet"
            puts "Min: 10"
            puts "Max: 500"
            player_bet = gets.strip.to_i
            @player_bet = player_bet
            p @player_bet
            if player_bet > @bank
                puts "Insufficient funds: place a smaller bet"
                #Could turn this into an error handling?
                return
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
                puts "Blackjack!"
                blackjack_win
            elsif @playerhand > 21
                puts "Bust!"
                round_loss
            else @playerhand < 21
                puts "Hit or Stand?"
                player_move = gets.strip
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
            puts "playerhand #{@playerhand}"
            puts "dealerhand #{@dealerhand}"
        
            dealer_play
        end
        
        def dealer_hand_two
            card = @deck.deal
            @dealerhand += card
            p @dealerhand
            if @dealerhand < 16
                dealer_hand_two
            else @dealerhand > 17 
                comparison
            end
        end
        
        def dealer_play
            if @dealerhand == 21
                puts "You lose!"
                round_loss
            elsif @dealerhand < 16
                dealer_hand_two
            else @dealerhand > 17 
                p @dealerhand
                comparison
            end
        end

        def blackjack_win
            winnings = @player_bet * 2
            p winnings
            @bank += winnings
            puts "Yay your bank is now #{@bank}"
            blackjackwin = "Black #{winnings}"
            @outcomes << blackjackwin
            p @outcomes
            start
        end

        def round_win
            puts "Player wins!"
            winnings = @player_bet * 1.5
            @bank += winnings
            puts "Yay your bank is now #{@bank}"
            better_wins = "Won #{winnings}"
            @outcomes << better_wins
            p @outcomes
            start
        end

        def round_loss
            puts "Dealer wins!"
            losses = @player_bet
            puts losses
            @bank -= losses
            puts "Your bank is now #{@bank}"
            better_losses = "Lost #{losses}"
            @outcomes << better_losses
            p @outcomes
            start
        end

        def comparison
            if @playerhand > @dealerhand
                round_win
            elsif @playerhand < @dealerhand
                round_loss
            else 
            end
        end
end




player_01 = Player.new("Izzy")
player_01.start


