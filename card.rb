# Definition of a Card
class Card
  attr_accessor :color, :suit, :face_value, :actual_value

  def initialize(color, suit, face_value, actual_value = nil)
    @color =        color
    @suit =         suit
    @face_value =   face_value.to_s
    if actual_value.nil?
      @actual_value = face_value.to_i
    else
      @actual_value = actual_value.to_i
    end
  end

  def is_ace?
    true unless @face_value != "A"
  end

  def to_s
    "#{@face_value.capitalize} of #{@suit.capitalize}s"
  end
end
