#!/usr/bin/ruby

require './utilities'
require './dealer'
require './player'
require './blackjack'

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
puts 'The dealer stands alone at his table, he invites you to'
puts 'sitdown and begins to unpack a deck of cards in front of you.'

dealer = Dealer.new
player = Player.new

while true
  blackjack = Blackjack.new(dealer, player)

  puts 'The dealer asks, how much will you wager? (T)en, T(w)enty-Five or (F)ifty?'
  key = Utilities.wait_for_instruction_key
  if key == 'T'
    player.money -= 10
    blackjack.wager = 10
  elsif key == 'W'
    player.money -= 25
    blackjack.wager = 25
  elsif key == 'F'
    player.money -= 50
    blackjack.wager = 50
  end

  puts 'You shake your pocket, you estimate you have $#{player.money} left'

  puts 'The dealer will now proceed to shuffle the deck.'
  dealer.deck.shuffle

  puts 'The dealer proceeds to deal quietly.'
  state = blackjack.deal_player
  Utilities.print_break

  puts 'The dealer voices his hand.'
  puts dealer.hand
  Utilities.print_break

  puts 'The dealer voices your hand.'
  puts player.hand
  Utilities.print_break

  while blackjack.state == 'play'

    ##################
    ## PLAYERS TURN ##
    ##################
    player_bust =     false
    dealer_bust =     false
    player_command = 'thinking'
    dealer_command = 'thinking'

    puts 'What will you do? (H)it, (S)tand or (L)eave?'
    key = Utilities.wait_for_instruction_key
    

    if key == 'H'
      player_command = 'hit'

      puts '"HIT ME" you command the dealer.'
      Utilities.print_break

      dealer.hit_me(player)

      puts 'The dealer voices your hand.'
      puts player.hand
      Utilities.print_break

      puts 'It\'s A BINGO! 21!' if player.card_value == 21

      player_bust = player.bust?
    elsif key == 'S'
      player_command = 'stand'

      puts 'Your decide it\'s best to stand. With a singular nod'
      puts 'the dealer knows what to do....'
      Utilities.print_break
      
    end

    ##################
    ## DEALERS TURN ##
    ##################
    puts 'The dealer evaluates his hand, and his life descisions.'
    Utilities.print_break
    
    if dealer.should_hit?
      dealer_command = 'hit'

      puts 'The Dealer decides it\'s time to take a hit.'
      Utilities.print_break
      
      dealer.hit_yourself

      puts 'The dealer voices his hand.'
      puts dealer.hand
      Utilities.print_break

      if player.best_hand != 21 && dealer.best_hand == 21
        puts 'Looks like you all be dead' 
        state = 'dealer_wins'
      end
    else
      dealer_command = 'stand'
      puts 'He seems to think he should take it easy here...'
      Utilities.print_break
    end

    #####################
    ## EVALUATE WINNER ##
    #####################
    break if state == 'dealer_wins'

    if player_bust
      state = 'dealer_wins'

      puts 'Turns out that you busted your hand, what a noob.'
      Utilities.print_break
      puts '            ~~~~ DEALER WINS ~~~~~'
      Utilities.print_break
    elsif dealer_command == 'stand' && !player_bust && player_command != 'hit'
      if dealer.best_hand > player.best_hand
        # Dealer Wins
        puts 'Looks like the dealer wins!'
        state = 'dealer_wins'
      elsif player.best_hand > dealer.best_hand
        # Player Wins
        puts 'Looks like you won!'
        state = 'player_wins'
      else
        # Tie
        puts 'It\'s a standoff!!!!'
        state = 'tie'
      end
    end

    
  end

  puts "The next card in the deck was going to be a #{dealer.deck.draw}"
end