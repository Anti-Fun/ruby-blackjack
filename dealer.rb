require './card'
require './deck'
require './player'

# The dealer player object.
class Dealer < Player
  attr_accessor :deck
  
  def initialize
    @deck = Deck.new(52)
    @cards = []
    @name = "Dealer"
  end

  def deal_quietly(player)
    @cards.push @deck.draw
    player.cards.push @deck.draw
    @cards.push @deck.draw
    player.cards.push @deck.draw
  end

  def deal_loudly(player)
    puts "Dealer draws his first card."
    @cards.push @deck.draw
    puts "Dealer draws your first card."
    player.cards.push @deck.draw
    puts "Dealer draws his second card."
    @cards.push @deck.draw
    puts "Dealer draws your second card."
    player.cards.push @deck.draw
  end

  def hit_me(player)
    card = @deck.draw
    puts "The Dealer draws you a card. It's a #{card.to_s}"
    player.cards.push card
  end

  def hit_yourself
    card = @deck.draw
    puts "The Dealer draws a card. It's a #{card.to_s}"
    @cards.push card
  end

  def should_hit?
    value = false
    if contains_ace?
      if upper_value > 21
        if lower_value < 16
          value = true
        end
      else
        if upper_value < 19
          value = true
        end
      end
    else
      if card_value < 16
        value = true
      end
    end
    value
  end
end
