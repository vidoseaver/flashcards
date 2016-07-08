gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess.rb'
require_relative "../lib/card.rb"
require_relative "../lib/deck.rb"

class DeckTest < MiniTest::Test

  def setup
    @card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    @card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    @card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")
    @deck = Deck.new([@card_1, @card_2, @card_3])
  end

  def test_does_the_deck_hold_cards
    assert_equal [@card_1, @card_2, @card_3], @deck.cards
  end

  def test_it_returns_number_of_cards_in_the_deck
    assert_equal 3, @deck.count
  end

end
end
