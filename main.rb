#!/usr/bin/ruby

require './utilities'
require './dealer'
require './player'

Utilities::clear_console
puts "\n\n"
puts '============================================================'
puts '============ Ultimate BlackJack Simulator 2015 ============='
puts '============================================================'
puts '=                                                          ='
puts '=            - Voted No.1 BlackJack Simulator -            ='
puts '=                     (by me *cough*)                      ='
puts '=                                                          ='
puts '=                 made by Christos Hrousis                 ='
puts '=                                                          ='
puts '=           ~ ~ ~  Press any key to Begin  ~ ~ ~           ='
puts '=                                                          ='
puts '============================================================'
Utilities::wait_for_any_key
Utilities::clear_console

puts '=                                                          ='
puts '============================================================'
puts "\n\nThe dealer will now take a seat, he invites you to sitdown"
puts "and begins to unpack a deck of cards in front of you.\n\n"
dealer = Dealer.new
player = Player.new
sleep(1)

puts "The dealer will now proceed to shuffle the deck."
dealer.deck.shuffle
sleep(1)

puts "The dealer proceeds to deal quietly.\n\n"
dealer.deal_quietly(player)
sleep(1)

puts "The dealer voices his hand."
puts dealer.hand + "\n\n"
sleep(1)

puts "The dealer voices your hand."
puts player.hand + "\n\n"
sleep(1)

puts "And so the game begins.....\n\n"
state = "playing"

while state == "playing"

  ## First it's the players turn, and at the start we assume he isn't bust.
  bust = false

  ## Ask the player if he wants to Hit or Stand
  puts 'What will you do? (H)it or (S)tand?'
  key = Utilities::wait_for_instruction_key
  sleep(1)
  ## If he hits, we deal him a card. otherwise we skip to dealer.
  if key == 'H'
    dealer.hit_me(player)

    puts "\n\nThe dealer voices your hand."
    puts player.hand + "\n\n"

    bust = player.is_bust?
  elsif key == 'S'
    puts "Your decide it's best to stand.\n\n"
    sleep(1)
  end

  if bust
    puts "Turns out that you busted your hand, what a noob.\n\n"
    puts "            ~~~~ DEALER WINS ~~~~~\n\n"
    break
  end
  sleep(1)
  ## Then it's the dealers turn.
  puts "The Dealer evaluates his hand, and his life descisions.\n\n"
  sleep(1)
  if dealer.should_hit?
    puts "The Dealer decides it's time to take a hit."
    dealer.hit_yourself
    puts "\n\nThe dealer voices his hand."
    puts player.hand + "\n\n"
  else
    puts "He seems to think he should take it easy here...\n\n"
  end
  sleep(1)
end

puts "The next card in the deck was going to be a #{dealer.deck.draw.to_s}"

