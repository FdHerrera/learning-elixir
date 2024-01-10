defmodule Cards do
  @moduledoc """
    Provides functionality to create and handle decks of cards.
  """

  @doc """
    Returns a list of strings representing a deck of cards.
  """
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

  @doc """
    Splits the given deck into 2 decks, a hand and a deck.
    The `hand_size` indicates the size of the hand.

  ## Examples

        iex> deck = Cards.create_deck
        iex> {hand, deck} = Cards.deal(deck, 1)
        iex> hand
        ["Ace of Spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def serve(hand_size) do
    create_deck() |> shuffle() |> deal(hand_size)
  end
end
