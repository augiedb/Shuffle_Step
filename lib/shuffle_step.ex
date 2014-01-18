defrecord Card, suit: nil, rank: nil, points: nil do

  def describe(record) do
    "#{record.rank} of #{record.suit} (#{record.points})"
  end

end

defmodule Deck do

  def create do
    lc rank inlist ['Ace',2,3,4,5,6,7,8,9,10,'Jack','Queen','King'], 
       suit inlist ['Hearts','Clubs','Diamonds','Spades'], 
    do: Card.new rank: rank, suit: suit, points: init_points(rank)
  end

  def init_points(points) when points in 2..10, do: points
  def init_points(points) when points == 'Ace', do: 1
  def init_points(_), do: 10 

  def shuffle(deck) do
    deck |> Enum.Shuffle
  end

  def is_a_match(card1, card2) do
    results = (card1.suit == card2.suit) or (card1.rank == card2.rank)
    results && 1 || 0
  end

# Alternate Ternary Operators
#    my_string = if condition, do: "value 1", else: "value 2"    <-- option #1 in Elixir
#    my_string = condition && "value 1" || "value 2"    <-- option #2 in Elixir

end

defmodule ShuffleStep do
  use Application.Behaviour

  # See http://elixir-lang.org/docs/stable/Application.Behaviour.html
  # for more information on OTP Applications
  def start(_type, _args) do
    ShuffleStep.Supervisor.start_link
  end

  def run do
    deck = Deck.create()
    [ first_card | rest ] = deck
    total_matches = count_matches(first_card, rest, 0)
    IO.puts "Total matches in an unshuffled Deck: #{total_matches}"

    deck1 = Deck.create() |> Enum.shuffle 
    [ first_card | rest ] = deck1
    total_matches = count_matches(first_card, rest, 0)
    IO.puts "Total matches in a shuffled Deck: #{total_matches}"

    deck2 = Deck.create() |> Enum.shuffle 
    [ first_card | rest ] = deck2
    total_matches = count_matches(first_card, rest, 0)
    IO.puts "Total matches in a shuffled Deck: #{total_matches}"






  end

  def count_matches(_card, [_head|[]], acc) do
    acc
  end

  def count_matches(card1, [card2 |tail], acc) do
    count_matches(card2, tail, acc + Deck.is_a_match(card1, card2))
  end



end
