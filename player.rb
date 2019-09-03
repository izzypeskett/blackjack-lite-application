require_relative 'deck-of-cards'



class Player
    def initialize(name)
        @name = name
        @bank = 1000
        @deck = Deck.new
        @playerhand = 0 
    end


    def starting_bet
        puts "Place bet"
        puts "Min: 10"
        puts "Max: 500"
        player_bet = gets.strip.to_i
        if player_bet > @bank
            puts "Insufficient funds: place a smaller bet"
            #Could turn this into an error handling?
        end
    end

    def the_deal
        rank1 = @deck.deal
        rank2 = @deck.deal
        @player_hand = rank1 + rank2
        player_hand
    end 

    def the_deal_two
        rank3 = @deck.deal
        @player_hand += rank3
        player_hand
    end
    
    def player_hand
        if @player_hand == 21
            puts "Blackjack!"
        elsif @player_hand > 21
            puts "Bust!"
        else @player_hand < 21
            puts "Hit or Stand?"
            player_move = gets.strip
            if player_move == "Hit"
                the_deal_two
            end
        end
    end


end

player_01 = Player.new("Izzy")

player_01.starting_bet
player_01.the_deal


