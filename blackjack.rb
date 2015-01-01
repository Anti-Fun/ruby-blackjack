require './dealer'
require './player'

# BlackJack game object
class Blackjack
  attr_accessor :dealer, :player
  
  def initialize(dealer, player)
    @dealer = dealer
    @player = player
  end

  def deal_player
    @dealer.deal_quietly(player)
    result = 'play'
    if @dealer.upper_value == 21 && @player.upper_value != 21
      result = 'dealer_wins'
    elsif @player.upper_value == 21 && @dealer.upper_value != 21
      result = 'player_wins'
    elsif @player.upper_value == 21 && @dealer.upper_value == 21
      result = 'draw'
    end
    result
  end
end