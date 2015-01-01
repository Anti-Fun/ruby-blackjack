require './utilities'

# Large pieces of console display
class Display
  class << self
    def introduction
      Utilities.clear_console
      puts '============================================================'
      puts '============ Ultimate BlackJack Simulator 2015 ============='
      puts '============================================================'
      puts '=                                                          ='
      puts '=      - Voted No.1 BlackJack Simulator In Coburg -        ='
      puts '=                                                          ='
      puts '=                 made by Christos Hrousis                 ='
      puts '=                                                          ='
      puts '=           ~ ~ ~  Press any key to Begin  ~ ~ ~           ='
      puts '=                                                          ='
      puts '============================================================'
      Utilities.wait_for_any_key
      Utilities.clear_console
      puts '=                                                          ='
      puts '============================================================'
      puts 'The dealer stands alone at his table, he invites you to'
      puts 'sitdown and begins to unpack a deck of cards in front of you.'
    end
  end
end
