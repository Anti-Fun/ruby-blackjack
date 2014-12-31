#!/usr/bin/ruby

require './utilities'
require './dealer'
require './player'

Utilities.clear_console
Utilities.print_break
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
Utilities.wait_for_any_key

Utilities.clear_console
puts '=                                                          ='
puts '============================================================'
Utilities.print_break
puts 'The dealer stands alone at his table, he invites you to'
puts 'sitdown and begins to unpack a deck of cards in front of you.'
Utilities.print_break

dealer = Dealer.new
player = Player.new

puts 'The dealer will now proceed to shuffle the deck.'
dealer.deck.shuffle
Utilities.pause

puts 'The dealer proceeds to deal quietly.'
Utilities.print_break
dealer.deal_quietly(player)
Utilities.pause

puts 'The dealer voices his hand.'
puts dealer.hand
Utilities.print_break
Utilities.pause

puts 'The dealer voices your hand.'
puts player.hand
Utilities.print_break
Utilities.pause

puts 'And so the game begins.....'
Utilities.print_break

state = 'playing'

while state == 'playing'

  ##################
  ## PLAYERS TURN ##
  ##################
  player_bust = false
  player_command = 'thinking'

  ## Ask the player if he wants to Hit or Stand
  puts 'What will you do? (H)it or (S)tand?'
  key = Utilities.wait_for_instruction_key
  Utilities.pause
  ## If he hits, we deal him a card. otherwise we skip to dealer.
  if key == 'H'
    puts '"HIT ME" you command the dealer.'
    Utilities.print_break

    dealer.hit_me(player)

    puts 'The dealer voices your hand.'
    puts player.hand
    Utilities.print_break

    player_bust = player.bust?
  elsif key == 'S'
    puts 'Your decide it\'s best to stand. With a singular nod'
    puts 'the dealer knows what to do....'
    Utilities.print_break
    Utilities.pause
  end

  if player_bust
    puts 'Turns out that you busted your hand, what a noob.'
    Utilities.print_break
    puts '            ~~~~ DEALER WINS ~~~~~'
    Utilities.print_break
    break
  end
  Utilities.pause

  ##################
  ## DEALERS TURN ##
  ##################
  puts 'The Dealer evaluates his hand, and his life descisions.'
  Utilities.print_break
  Utilities.pause
  if dealer.should_hit?
    puts 'The Dealer decides it\'s time to take a hit.'
    Utilities.print_break
    Utilities.pause
    dealer.hit_yourself

    puts 'The dealer voices his hand.'
    puts dealer.hand
    Utilities.print_break
  else
    puts 'He seems to think he should take it easy here...'
    Utilities.print_break
  end
  Utilities.pause
end

puts "The next card in the deck was going to be a #{dealer.deck.draw}"
