class Player

  attr_accessor :name, :hand, :books

  def initialize(name)
    @name = name
    @hand= Hand.new([])
    @books = []
  end

  def cards
    @hand.cards
  end

  #checks if another player has given value, returns true or false
  def asks_for_card(another_player, value)
    raise "Can't ask for something you don't have in hand" unless @hand.check_cards(1, value)
    another_player.hand.check_cards(1, value)
  end

  #transfers card(s) from other players hand into own hand
  def gimme_da_cards(another_player, value)
    if another_player.hand.check_cards(1, value)
      @hand.add(another_player.hand.drop(value))
    else
      raise "missing from other hand"
    end
  end

  #gets a card from the deck and puts it into the players hand
  def go_fish(deck)
    c = deck.get_card
    @hand.add(c)
    c[0].value
  end

  #moves book into book array and removes from hand
  def lays_down_book

    # if has_book
    b = @hand.has_book

    if b
      @book += @hand.drop(b)
    else
      raise "NO BOOK DUMMY!"
    end
  end

  #given
  def has_book
    @hand.has_book
  end

end#class
