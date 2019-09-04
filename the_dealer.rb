require_relative 'deck-of-cards'
class Dealer

    def initialize 
        @dealer_hand = 0
    end
    def dealer_hand
        puts "Dealers hand:"
        puts " ------------ "
        rank1 = @deck.deal
        rank2 = @deck.deal
        puts " ------------ "
        @dealerhand = rank1 + rank2
        puts "Dealers total = #{@dealerhand}"
        dealer_play
        end
        
        def dealer_hand_two
            card = @deck.deal
            @dealerhand += card
            puts "Dealers total = #{@dealerhand}"
            dealer_play
        end
        
        def dealer_play
            if @dealerhand == 21
                puts "You lose!"
                outcome
            elsif @dealerhand <= 16
                dealer_hand_two
            elsif @dealerhand > 17 && @dealerhand < 21
                outcome
            else @dealerhand > 21
                puts "Dealer bust!"
                p @dealerhand
                @bank += @player_bet * 1.5
                start
            end
        end

end

