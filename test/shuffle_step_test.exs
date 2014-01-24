defmodule ShuffleStepTest do
  use ExUnit.Case

  test "Card Matches Work" do
    c1 = Card.new rank: 'Jack', suit: 'Clubs',  points: 10
    c2 = Card.new rank: 5,      suit: 'Hearts', points: 5
    match = Card.new rank: 'Jack', suit: 'Hearts', points: 10
    
    assert(Deck.is_a_match(c1, c2) == 0)
    assert(Deck.is_a_match(c1, match) == 1)
    assert(Deck.is_a_match(c2, match) == 1)
  end

end
