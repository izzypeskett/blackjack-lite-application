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