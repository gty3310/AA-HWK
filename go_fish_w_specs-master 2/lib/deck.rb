require_relative "card"
class Deck

  attr_reader :cards

  #factory method, returns an array containing 52 new card objects of
  #all suits and values
  def self.all_cards
    result = []
    Card.suits.product(Card.values) do |s,v|
      result << Card.new(s,v)
    end
    result
  end

  #initializess with 52 cards
  def initialize(cards = Deck.all_cards)
    @cards = cards
  end


  #retrieves one card from the deck in an array
  def get_card
    raise 'NO MORE CARDS' if empty?
    [@cards.shift]
  end

  #shuffles cards
  def shuffle!
    @cards.shuffle!
  end

  #given
  def empty?

     @cards.empty?
  end

end#class
