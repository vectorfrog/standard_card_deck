defmodule Card do
  defstruct [:value, :suit, :color, :face]

  @suits ['♥', '♦', '♠', '♣']

  @value 1..13

  def new(%{suit: suit, value: value}) do
    color = case suit do
      '♥' -> "red"
      '♦' -> "red"
      '♠' -> "black"
      '♣' -> "black"
    end
    face = case value do
      13 -> true
      12 -> true
      11 -> true
      _ -> false
    end
   %Card{suit: suit, value: value, color: color, face: face}
  end

  def get_color(suit) when suit in ['♦', '♣'], do: IO.ANSI.white()
  def get_color(suit) when suit == '♥', do: IO.ANSI.red()
  def get_color(suit) when suit == '♠', do: IO.ANSI.black()

  def get_background(suit) when suit in ['♥', '♠'], do: IO.ANSI.white_background()
  def get_background(suit) when suit == '♦', do: IO.ANSI.red_background()
  def get_background(suit) when suit == '♣', do: IO.ANSI.black_background()

  def print_friendly(%Card{suit: suit, value: value}) do 
    display = case value do
      13 -> "K"
      12 -> "Q"
      11 -> "J"
      1 -> "A"
      val -> val |> Integer.to_string
    end
    {:ok, suit |> List.to_string, display}
  end

  def term_string(card = %Card{suit: suit, value: value}) do
    {:ok, print_suit, print_val} = print_friendly(card)
    get_background(suit) <> get_color(suit) <> " " <> print_val <> print_suit <> " " <> IO.ANSI.reset()
  end

end
