require_relative 'deck-of-cards'
class Dealer

    def initialize 
        @dealer_hand = 0
        dealer_hand
    end
def dealer_hand
    rank1 = @deck.deal
    rank2 = @deck.deal
    @dealerhand = rank1 + rank2
    dealer_play
end

def dealer_hand_two
    card = @deck.deal
    @dealerhand += card
end

def dealer_play
    if @dealerhand == 21
        puts "You lose!"
    elsif @dealerhand < 16
        dealer_hand_two
    else @dealerhand > 17
       puts "You win!"
    end
end
end