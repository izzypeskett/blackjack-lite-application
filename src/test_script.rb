require_relative 'deck_of_cards'

## Assesing the deck is creating a card and converting to integer 
## When assesing the return method the data type of the card should return as an integer

deck = Deck.new
p deck.deal.class


## Assessing the object created is true using the .nil? method 
## after a deck is created and shuffled and a card is picked, assessment of nil will print false

test_deck = Deck.new
p test_deck.deal.nil?
