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

  def icons
    heart = "\u2661".encode('utf-8')
    spade = "\u2664".encode('utf-8')
    diamond = "\u2662".encode('utf-8')
    club = "\u2667".encode('utf-8')
    { heart: heart, spade: spade, diamond: diamond, club: club }
  end

  def icon
    icons[@suit.to_sym]
  end

  def ace?
    true unless @face_value != 'A'
  end

  def to_s
    "#{@face_value.capitalize} of #{@suit.capitalize}s"
  end
end
