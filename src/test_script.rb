
@name = "Testabelle"


case deal
when answer = PROMPT.select("What's your move?", %w(Deal Exit))
    answer = "Deal"
end

case bet
when player_bet = PROMPT.select("Place a bet", %w(10 100 200 500))
    @player_bet = 100
end

case hand
when @playerhand < 16
    player_move = "Hit"
when @playerhand > 16
    player_move = "Stand"
end

case ace
when ace_option = PROMPT.select("What does your ace equal?", %w(1 11))
    ace_option = 11
end

