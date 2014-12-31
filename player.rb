require './card'
require './deck'

# The primary player object.
class Player
  attr_accessor :cards, :name

  def initialize
    @cards = []
    @name = 'Player'
  end

  def contains_ace?
    contains_ace = false
    @cards.each do |card|
      contains_ace = true if card.face_value == 'A'
    end
    contains_ace
  end

  def card_value
    value = upper_value
    if contains_ace?
      if upper_value > 21
        value = lower_value
      else
        value = "#{upper_value} or #{lower_value}"
      end
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
      if card.ace?
        value += 1
      else
        value += card.actual_value
      end
    end
    value
  end

  def bust?
    result = false
    if contains_ace?
      result = true if lower_value > 21
    else
      result = true if card_value > 21
    end
    result
  end

  def hand
    hand = "#{@name} holds"
    @cards.each_with_index do |card, index|
      if index == @cards.size - 1
        hand += " and a #{card}. Totaling: #{card_value}"
      else
        hand += " a #{card},"
      end
    end
    hand
  end
end
