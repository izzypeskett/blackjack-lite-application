def round_win
    puts "Player wins!"
    winnings = @player_bet * 1.5
    @bank += winnings
    puts "Yay your bank is now #{@bank}"
    better_wins = "Won #{winnings}"
    @outcomes << better_wins
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
    start
end

def blackjack_win
    winnings = @player_bet * 2
    p winnings
    @bank += winnings
    puts "Yay your bank is now #{@bank}"
    blackjackwin = "Black #{winnings}"
    @outcomes << blackjackwin
    start
end

def outcome
    if @playerhand > @dealerhand
        puts "Player wins!"
        @bank += @player_bet * 1.5
    elsif @playerhand < @dealerhand
        puts "Dealer wins!"
        @bank -= @player_bet
    else @playerhand == @dealerhand
        puts "Even Steven! No Winner."
    end
    start
end