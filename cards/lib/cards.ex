defmodule Cards do
  def create_deck do
    cards = [
      "Ace",
      "Two",
      "Three",
      "Four",
      "Five",
      "Six",
      "Seven",
      "Eight",
      "Nine",
      "Ten",
      "J",
      "Q",
      "K"
    ]

    suits = ["Spades", "Clubs", "Hearts", "Diamonds"]

    for card <- cards, suit <- suits do
      "#{card} of #{suit}"
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  def contains(deck, card) do
    Enum.member?(deck, card)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _} -> "File not found"
    end
  end

  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def serve(hand_size) do
    create_deck() |> shuffle() |> deal(hand_size)
  end
end
