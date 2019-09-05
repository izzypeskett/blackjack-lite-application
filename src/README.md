# Help File

# Blackjack Lite Software Development Plan 
## Statement of purpose 
Blackjack Lite is an interactive digital version of the popular casino game blackjack. This terminal application allows the user to play rounds of blackjack against a programmed or bot dealer. 

The game is initiated by asking the user for their player name. Once the terminal has recieved this standard input the user gets to enjoy countless rounds of Blackjack. There are only two ways to exit the application
1. If the user's bank account, which begins at $1000, is at less than $10 
2. If the user chooses to exit the application

Otherwise, the application allows the user to continuously get dealt a new hand after each round.
Blackjack Lite follows the standard rules of blackjack; which can be sourced from this [link.](https://bicyclecards.com/how-to-play/blackjack/) The current version of Blackjack Lite, however, does not allow the user to
- "split" their hand
- call "insurance" 
- "double down" 
- play 5 card charlie 
- reveal the dealers first card when player gets their hand

Once the application has ended the terminal outputs the users playing history. The playing history highlights how many rounds the user played, their betting history and their bank account after each round. 

### Problems being addressed
Blackjack Lite was designed to address the identified problems: 
- the cost involved with having to play blackjack, 
- the need for a dealer,
- having to attend a casino to play blackjack, 
- the complexity of competitor online blackjack games or setting up your own blackjack game

Blackjack Lite addresses the above problems: 

1. It allows the user to practice and finesse their blackjack abilities with minimal risk, as the application is free and requires no upfront cost.

2. The application has a preprogrammed dealer, allowing the user to play individually. 

3. By removing the friction of attending a casino, Blackjack Lite provides an easily accessible form of personal entertainment for users. 

4. Blackjack Lite is designed with simplicity, intended for the user to continuously play with ease. 

### Target Audience
Per law, Blackjack Lite is intended for users who are 18 years or older. The user persona would be those who need a short burst of simple entertainment whilst commuting or waiting. The secondary target audience is users who want to perfect the art of blackjack. Although many would say blackjack is a game of luck. 

Blackjack Lite can be implemented and accessed via the users' smartphone, whilst they have an internet connection and online through their personal computer, laptop or tablet. 

Currently, the application has only been designed to run through the terminal. The ruby code will be run through the terminal where the user will interact with Blackjack Lite. 

## Features
### Creation, shuffle and dealing of a 52-card deck. 
Created two classes ````Card```` and ````Deck````.

```` class Deck ```` loops through the ranks array and pairs it with an element of the suits array. This is done through iterating through the suits array within the iteration of the ranks array. By use of ````.each```` method 

The newly created deck, which takes the instance methods from the ````class Card```` (via pushing ````Card.new```` into an instance variable - this was needed to be done to expand the scope of the methods),is then shuffled and the first card of the deck is taken (and deleted) using the ````.shift```` method. This ensures that the same card can never appear twice. Using methods from ````class Card```` the card or cards dealt appear as a string in their respective colour of either black or red. 

### A bot dealer the user plays against
Created a ruby script for the dealer. Created ````class Dealer```` and within the class defined instance methods that acted as the dealers parameters. Used if or else statements to compare the dealers hand (sum of the cards when converted to an integer) with set integers.
````
if @dealerhand == 21
      puts 'You lose!'
      outcome
    elsif @dealerhand <= 16
      dealer_hand_two
    elsif @dealerhand >= 17 && @dealerhand < 21
      outcome
    else @dealerhand > 21
         puts 'Dealer bust!'
         @bank += @player_bet * 1.5
         history
    end
````

I called upon methods within methods to continue the loop of the dealers plays. The dealer instance methods only run once the player has selected the "stand" option. 

### User interface
To increase the user experience of Blackjack Lite the application utilises multiple ruby gems to add colour, fonts, user-friendly prompts and string manipulation methods. 
Ruby gems installed include
- colorize
- rainbow
- tty-font
- tty-prompt
- artii

These gems were specifically chosen to not only improve the user experience of Blackjack Lite but to also reduce user error by using the prompt gem. 
The gems rainbow, tty-font, tty-prompt, and artii were given constant variables to be able to be used globally. 

## User Experience

I conducted a manual test on my major features to assess error handling; this can be found by clicking [here.](https://docs.google.com/spreadsheets/d/1y_Yw6bj7aOeQmeq-Wxl_UqpRjmESkI5HKRMG7LL7Xhk/edit?usp=sharing) 

## Control Flow Diagram 

Control flow diagram can be viewed [here.](https://drive.google.com/file/d/1fgrfDNvJ-X5Q-3f6wPLpYG7PUDlDEqDE/view?usp=sharing)

### Key for control-flow:
- Circle = Initiation/Termination of application

- Rectangle = Method or Process

- Parallelagram = Requires user input

- Diamond = Decision

- [   ] = Decision options 

- ----> = Direction of the flow 

# Implementation Plan

# Test Application