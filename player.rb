require './card'
require './deck'

# The primary player object.
class Player
  attr_accessor :cards, :name
  
  def initialize
    @cards = []
    @name = "Player"
  end

  def contains_ace?
    contains_ace = false
    @cards.each do |card|
      if card.face_value == "A"
        contains_ace = true
      end
    end
    contains_ace
  end

  def card_value
    value = 0
    if contains_ace?
      value = "#{upper_value} or #{lower_value}"
    else
      value = upper_value
    end
    value
  end

  def upper_value
    value = 0
    @cards.each do |card|
      value += card.actual_value
    end
    value
  end

  def lower_value
    value = 0
    @cards.each do |card|
      if card.is_ace?
        value += 1
      else
        value += card.actual_value
      end
    end
    value
  end

  def is_bust?
    if contains_ace?
      if lower_value > 21
        true
      else 
        false
      end
    else
      if card_value > 21
        true
      else 
        false
      end
    end
  end

  def hand
    hand = "#{@name} holds"
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
