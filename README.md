# ReadMe - Blackjack Lite 
A simple interactive terminal application game of blackjack with Ruby

## Table of contents
* [General info](#general-info)
* [Git Hub](#git-hub)
* [Technologies](#technologies)
* [Setup](#setup)
* [Gameplay](#gameplay)
* [Features](#features)
* [Contact](#contact)
* [Software development plan](#software-development-plan)
* [Implementation plan](#implementation-plan)
* [Test Application](#test-application)



## General info
This terminal application was created as part of Coder Academy's Fast Track course work.

## Git Hub 

Here is the link to my blackjack-lite [git repository](https://github.com/izzypeskett/blackjack-lite-application) 

## Technologies
- Ruby version: 2.5.1
    - required homebrew and `rbenv`

## Setup
Clone the repository 
````
git@github.com:izzypeskett/blackjack-lite-application.git
````

```` cd ```` into the directory you have cloned

To run this terminal application run the shell script, in the command-line type:
````
  bash build.sh
````
This will setup your local environment 

```` cd ```` into the ```` dist ```` directory
````
cd dist/
````
 To run the ruby file, in the command-line type and hit enter/return:
````
ruby blackjack_play.rb
````

This will run the ruby script and the game will begin! 

For a version of the game with hints, in the command-line type and hit enter/return:
````
ruby blackjack_play.rb -hint
````
## Gameplay
To begin the game enter your name in the command-line when prompted. 

````Howdy! What's your player name?````

Use the keys on your keyboard to enter your name. 

Click the return key to confirm your name. 

The game will then give you prompts, which you control with the arrow keys. 
````
What's your move? (Use ↑/↓ arrow keys, press Enter to select)
‣ Deal
  Exit
````

To exit the game select the Exit option

The aim of the game is to beat the dealer. 

- Blackjack = Ace and a 10 or a picture card. 
- Bust = when the sum of the players hand is greater than 21
- Player wins = when the sum of the players hand is greater than the dealers hand or the dealer busts
- Player loses = when the sum of the players hand is less than the dealers hand
- Draw = when the sum of the players hand is equal to the dealers hand. 


Your bank account starts at $1000

````
Howdy player01
player01s bank: $1000
````

To start a new hand you must place a bet. 

Once a bet has been placed, depending on whether you get a blackjack, win or lose this bet will either be multipled and added to your bank or subtracted from your bank. 


If your bank account gets below $10 you will have to wait 60 seconds before it refreshes back to $1000

Goodluck partner!

## Features
- Use of tty-prompt to reduce user error
- continuous gameplay functionality 
- ability to play with or without hints
- bot dealer

**To-Do list**
- Add split, double-down, insurance and 5-card charlie rules
- Create levels of difficulty 
- Add multi-player function 
- Fix two aces on beginning error

## Status
Project is: *submitted for assessment* and *in progress*

## Contact
Created by [@izzypeskett](https://twitter.com/Izzypeskett)

# Software Development Plan 
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
Created a ruby script for the dealer. Created ````class Dealer```` and within the class defined instance methods that acted as the dealers parameters. Used conditionals (if/else and until) statements to compare the dealers hand (sum of the cards when converted to an integer).

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

The user will learn how to interact with the terminal application through the README markdown. 

The setup section takes the user through the required steps to set up their local environment. 

The gameplay section provides the user with instructions on how to interact with and use each feature in the terminal application. 

The installation of the ruby gem tty-prompt reduces user input error as defined inputs were created. 

The user will use either the up or down arrow and the return or enter key to interact with the application. The only time it requires the user for input is during the creation of the player name. 

````
What's your move? (Use ↑/↓ arrow keys, press Enter to select)
‣ Deal
  Exit
````

If the player name created is greater than 10 characters an error message appears informing the user to create a valid user name. The user is sent back to the player creation name method. 

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

I used Trello as my project management tool for my implementation plan. 
I created two boards
1. The overall assignment management: view [here](https://trello.com/b/touakIZk/terminal-application) 
2. The application implementation plan: view [here](https://trello.com/b/oeYrZkPg/implement-application) 

### Key for my Trello board
Red label = To do

Yellow label = In progress

Green label = Done

## Usage of Trello boards
I created cards for each area of the assignment i.e. documentation, planning, build etc. 
I set dates for when certain tasks were due and labelled each task accordingly

Screenshots of use of Trello can be accessed [here](https://drive.google.com/drive/folders/147_-lJ0-Pu2v5i7CyROZlTulzCNtktjn?usp=sharing)

# Test Application

I conducted a manual and automatic test.

## Manual Test
The manual testing was used to assess any user errors and how the application would handle these errors. Whilst also assessing for any errors within the code.
The manual test was conducted in a google spreadsheet which can be viewed [here](https://docs.google.com/spreadsheets/d/1y_Yw6bj7aOeQmeq-Wxl_UqpRjmESkI5HKRMG7LL7Xhk/edit#gid=664418666)

## Automatic Test
The automatic testing was difficult, due to the fact that the code written had many points of user interaction. The user interacts with the application through the use of a prompt. 

Because of this I tested my deck of cards feature. I ran a test script to assess whether the card being produced returned as an integer. My second test script I ran assessed whether the card created was nil. 
As expected the an error message appeared as attempting to call upon a 53rd element of the array was nil as it does not exist. 
To solve this error and allow the user to continusouly play I added in code to re-create new decks at two points dependent on if the array was nil on getting dealt their first hand or after a hit. 

````
 begin
      @playerhand = @card1 + @card2
      raise if @card1.nil? || @card2.nil?
    rescue StandardError => e
      puts 'END OF DECK: RESHUFFLING!'
      @deck = Deck.new
      start
    end
````

