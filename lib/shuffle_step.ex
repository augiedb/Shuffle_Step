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
    deck |> Enum.shuffle
  end

  def is_a_match(card1, card2) do
    (card1.suit == card2.suit) or (card1.rank == card2.rank)
  end

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
    [first_card | rest ] = deck
    total_matches = count_matches(first_card, rest, 0)
    IO.puts "Total matches: #{total_matches}"
  end

  def count_matches(_card, [head|[]], acc) do
    acc
  end

  def count_matches(card1, [head|tail], acc) do
    [card2, rest]  = head
    count_matches(card2, rest, acc + Deck.is_a_match(card1, card2))
  end



end
