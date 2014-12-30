require './card'
require './deck'

# The primary player object.
class Player
  attr_accessor :cards
  
  def initialize
    @cards = []
  end

  def card_value
    value = 0
    @cards.each do |card|
      value += card.actual_value
    end
    value
  end

  def is_bust?
    if card_value > 21
      true
    else 
      false
    end
  end

  def hand
    hand = "You hold"
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
