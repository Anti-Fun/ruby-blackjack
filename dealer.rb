require './card'
require './deck'

# The dealer player object.
class Dealer
  attr_accessor :deck
  
  def initialize
    @deck = Deck.new(52)
    @cards = []
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

  def card_value
    value = 0
    @cards.each do |card|
      value += card.actual_value
    end
    value
  end

  def hand
    hand = "Dealer holds"
    @cards.each_with_index do |card, index|
      if index == @cards.size - 1
        hand = hand + " and a #{card.to_s}. Totaling: #{card_value}"
      else
        hand = hand + " a #{card.to_s},"
      end
    end
    hand
  end
end
