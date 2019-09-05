# Development Log
## Status Update #1
I am creating an interactive digital version of the popular casino game blackjack. My terminal application is called Blackjack Lite. 

I initiated my assignment by creating a rough draft of a control-flow diagram. Once assessing the do-ability of my terminal application I used Trello as my project management tool for the implementation plan.

However, I noticed I quickly delved into creating and formulating my code and did not strictly follow my project management plan. I did this to assess if I had the skills and time to create the code I envisioned. 

Once I got a fundamental skeleton of my code, albeit have not yet made it DRY, I committed it to my git repository. 

By the end of the first day, I managed to create a functioning code for the user to play blackjack against a pre-programmed dealer. 

### Current features my code contains:

- class
- calling methods within methods
- conversion of strings to integers 
- the use of two gems; colorize and tty-prompt 
- if,else statements
- pushing data into an array 

### Current bugs I am fixing:

1. currently, anytime the player gets 21 (even if their card number is over 2) the code reads it and calls the method blackjack   
2. Ace is only programmed to be converted to 11, I am unsure of how to make it 1 or 11 - an option I am contemplating is anytime an "A" appears the user has the option of deciding if the value is 1 or 11.

## Status Update #2
Very exciting I have a fully functioning code for Blackjack Lite. 
It allows the user to create a player name and play continuous rounds of blackjack against a bot dealer. 

I have solved both my previous issues
1. I created a method called ace option that whenever the player receives an Ace it allows the player to either select (using tty-prompt) 1 or 11 which changes the value of the Ace and updated the player hand total. I also created set parameters for the bot dealer when they receive an Ace. Code below:

````
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
````

2. To solve the issue of blackjack I created a variable within the initialize method of the player that created an array of the cards the player was dealt. I used the length method on the array to count the elements in the array. If the array length is greater than 2 the blackjack method is NOT called. 

### Day #2 and the morning of Day #3 
I implemented the use of ARGV. 
Initially had major issues with this. When getting the user to run the ruby file with an argument it picked up the player name to be longer than 10 characters and the code got caught in my begin and rescue. 
Adding ```` STDIN ```` in front of the ````gets.strip```` solved this error. Unsure of why this solved it, will need to do further research to comprehend the error. 

I finished the manual testing of my code with only 1 minor error. Through this, I realised completing the manual testing earlier in my code creation would have been more useful. 