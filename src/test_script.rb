# frozen_string_literal: true

require_relative 'deck_of_cards'

## Assesing the deck is creating a card and converting to integer
## When assesing the return method
## the data type of the card will return as an integer

deck = Deck.new
p deck.deal.class

## Assessing the object created is true
## A deck only has 52 cards
## On the 53rd loop an error message will produce
## as the object will be nil and the code will break.
## To solve this error a begin and rescue was placed to restart the deck.

deck = Deck.new
p deck.deal.class
53.times do
  deck.deal
end
