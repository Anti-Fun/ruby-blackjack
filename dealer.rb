require './card'
require './deck'
require './player'

# The dealer player object.
class Dealer < Player
  attr_accessor :deck

  def initialize
    @deck = Deck.new(52)
    @cards = []
    @name = 'Dealer'
  end

  def deal_quietly(player)
    @cards.push @deck.draw
    player.cards.push @deck.draw
    @cards.push @deck.draw
    player.cards.push @deck.draw
  end

  def deal_loudly(player)
    puts 'Dealer draws his first card.'
    @cards.push @deck.draw
    puts 'Dealer draws your first card.'
    player.cards.push @deck.draw
    puts 'Dealer draws his second card.'
    @cards.push @deck.draw
    puts 'Dealer draws your second card.'
    player.cards.push @deck.draw
  end

  def hit_me(player)
    card = @deck.draw
    puts "The Dealer draws you a card. It's a #{card}"
    player.cards.push card
  end

  def hit_yourself
    card = @deck.draw
    puts "The Dealer draws a card. It's a #{card}"
    @cards.push card
  end

  def should_hit?
    value = false
    if contains_ace?
      value = true if (upper_value > 21 && lower_value < 16) || upper_value < 19
    else
      value = true if card_value < 16
    end
    value
  end
end
