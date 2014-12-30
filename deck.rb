require './card'

# Definition of a Deck, a collection of Cards
class Deck
  attr_accessor :pack, :cards, :dead

  def initialize(deck_type = nil)
    colors =      %w(Red Black)
    red_suits =   %w(Heart Diamond)
    black_suits = %w(Club Spade)
    face_values = %w(A K Q J 10 9 8 7 6 5 4 3 2)

    @pack =  []
    colors.each do |color|
      if color == 'Red'
        red_suits.each do |suit|
          face_values.each do |face_value|
            if face_value == 'A' 
              @pack << Card.new(color, suit, face_value, 11)
            elsif face_value == 'K' || face_value == 'Q' || face_value == 'J'
              @pack << Card.new(color, suit, face_value, 10)
            else
              @pack << Card.new(color, suit, face_value)
            end
          end
        end
      else # color == black
        black_suits.each do |suit|
          face_values.each do |face_value|
            if face_value == 'A' 
              @pack << Card.new(color, suit, face_value, 11)
            elsif face_value == 'K' || face_value == 'Q' || face_value == 'J'
              @pack << Card.new(color, suit, face_value, 10)
            else
              @pack << Card.new(color, suit, face_value)
            end
          end
        end
      end
    end
    @cards = @pack.dup
    @dead =  []
  end

  def restack
    @dead = []
    @cards = @pack.dup
  end

  def shuffle
    @cards.shuffle!
  end

  def draw
    @cards.delete_at(0)
  end

  def count
    @cards.count
  end
end
