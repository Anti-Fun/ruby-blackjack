require './dealer'
require './player'

# BlackJack game object
class Blackjack
  attr_accessor :dealer, :player, :wager

  def initialize(dealer, player)
    @dealer = dealer
    @player = player
    @state = 'play'
  end

  def deal_player
    @dealer.deal_quietly(player)
    if @dealer.upper_value == 21
      @player.upper_value == 21 ? @state = 'draw' : @state = 'dealer_wins'
    elsif @dealer.upper_value != 21 && @player.upper_value == 21
      @state = 'player_wins'
    end
    @state
  end

  def player_can_split?
    h = Hash.new(0)
    @player.cards.each { |c| h[c.actual_value] += 1 }
    h.any? { |count| count > 1 }
  end
end
