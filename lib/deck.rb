require_relative "guess.rb"
require_relative "round.rb"
require_relative "card.rb"
require "pry"

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end
end
