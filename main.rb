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
puts '=      - Voted No.1 BlackJack Simulator In Coburg -        ='
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

if dealer.upper_value == 21 && player.upper_value != 21
  puts 'The dealer\'s eyes slowly glaze over, as a smile slowly'
  puts 'cracks across his face.'
  Utilities.pause
  puts 'His eyes make contact with yours and he announces that'
  puts 'your soul is his.'
  Utilities.pause
  puts 'He removes his garments to reveal that he is the Devil.'
  Utilities.pause
  puts '"You did\'t really think you would get to play BlackJack"'
  puts 'he cackles as the ground beneath your bar stoll opens up'
  puts 'and you fall into the depths of hell...'
  Utilities.pause
elsif player.upper_value == 21 && dealer.upper_value != 21
  puts 'The dealer cringes after he voices your cards, he knows'
  puts 'what is about to happen.'
  Utilities.pause
  puts 'A businessman from behind the curtain appears and hands'
  puts 'you your winnings. After he passes you the briefcase,'
  puts 'the dealer is whisked away with a gun in his back.'
  Utilities.pause
  puts 'From behind the same curtain another dealer nervously steps'
  puts 'up to the plate, and stutters as he asks "Care for another?"'
  Utilities.pause
else
  state = 'playing'
  puts 'And so the game begins.....'
  Utilities.print_break
end

while state == 'playing'

  ##################
  ## PLAYERS TURN ##
  ##################
  player_bust =     false
  dealer_bust =     false
  player_command = 'thinking'
  dealer_command = 'thinking'

  puts 'What will you do? (H)it or (S)tand?'
  key = Utilities.wait_for_instruction_key
  Utilities.pause

  if key == 'H'
    player_command = 'hit'

    puts '"HIT ME" you command the dealer.'
    Utilities.print_break

    dealer.hit_me(player)

    puts 'The dealer voices your hand.'
    puts player.hand
    Utilities.print_break

    player_bust = player.bust?
  elsif key == 'S'
    player_command = 'stand'

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
    dealer_command = 'hit'

    puts 'The Dealer decides it\'s time to take a hit.'
    Utilities.print_break
    Utilities.pause
    dealer.hit_yourself

    puts 'The dealer voices his hand.'
    puts dealer.hand
    Utilities.print_break
  else
    dealer_command = 'stand'

    puts 'He seems to think he should take it easy here...'
    Utilities.print_break
  end
  Utilities.pause
end

puts "The next card in the deck was going to be a #{dealer.deck.draw}"
