# allows you to execute ./build.sh without the bash keyword
chmod +x ./build.sh
# copy across files to distribution directory
mkdir dist
cp ./src/blackjack_play.rb ./dist
cp ./src/deck_of_cards.rb ./dist
cp ./src/bot_dealer.rb ./dist
# install all gems
gem install artii
gem install colorize 
gem install tty-font
gem install tty-prompt
gem install rainbow