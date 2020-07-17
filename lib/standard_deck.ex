defmodule StandardDeck do
  @moduledoc """
  Documentation for StandardDeck.
  """
  defstruct [:cards]

  import Card
  @suits ['♥', '♦', '♠', '♣']

  @values 1..13

  @doc """
  Hello world.

  ## Examples

      iex> StandardDeck.hello()
      :world

  """
  def new() do
    deck = for suit <- @suits, val <- @values, do: Card.new(%{value: val, suit: suit})
    %StandardDeck{cards: deck}
  end

  def shuffle(deck), do: %StandardDeck{deck | cards: deck.cards |> Enum.shuffle}


end
