require_relative 'deck-of-cards'
class Dealer

    def initialize 
        @dealer_hand = 0
    end

    def dealer_hand
        puts "Dealers hand:"
        puts " ------------ "
        card1 = @deck.deal
        card2 = @deck.deal
        puts " ------------ "
        @dealerhand = card1 + card2
            if card1 == 11 && @dealerhand > 10 && @dealerhand != 21
                card1 = 1
                @dealerhand = card1 + card2
            else
            end
            if card2 == 11 && @dealerhand > 10 && @dealerhand != 21
                card2 = 1
                @dealerhand = card1 + card2
            else
            end
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
        elsif @dealerhand >= 17 && @dealerhand < 21
            outcome
        else @dealerhand > 21
            puts "Dealer bust!"
            @bank += @player_bet * 1.5
            history
        end
    end

end
