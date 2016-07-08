gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/flashcard.rb'

class CardTest < MiniTest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau")
  end

  def test_it_has_a_question
    assert_equal "What is the capital of Alaska?", @card.question
  end

  def test_it_has_an_answer
    assert_equal "Juneau", @card.answer
  end

end

class GuessCorrectTest < MiniTest::Test

  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau")
    @guess = Guess.new("Juneau", @card)
  end

  def test_guess_card
    assert_equal @card, @guess.card
  end

  def test_if_correct_returns_true
    assert_equal true, @guess.correct?
  end

  def test_if_response_equals_answer
    assert_equal "Juneau", @guess.response
  end

  def test_if_feedback_returns_correct
    assert_equal "Correct!", @guess.feedback
  end

class GuessIncorrectTest < MiniTest::Test

  def setup
    @card = Card.new("Which planet is closest to the sun?", "Mercury")
    @guess = Guess.new("Saturn", @card)
  end

  def test_guess_card
    assert_equal @card, @guess.card
  end

  def test_guess_does_not_equal_response
    assert_equal "Saturn", @guess.response
  end

  def test_guess_correct_returns_false
    assert_equal false, @guess.correct?
  end

  def test_feedback_returns_incorrect
    assert_equal "Incorrect.", @guess.feedback
  end

end

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

class RoundTest < MiniTest::Test

  # def setup
  #   @card_1 = Card.new("What is the capital of Alaska?", "Juneau")
  #   @card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
  #   @deck = Deck.new([@card_1, @card_2])
  #   @round = Round.new(@deck)
  # end

  def test_huh
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal deck, round.deck

  end

  def test_it_stores_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_it_knows_the_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal card_1 , round.current_card
  end
#
  def test_it_records_the_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Guess, round.record_guess("Juneau")
  end
  def test_it_counts_the_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
  end
  def test_it_provides_the_right_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")

    assert_equal  "Correct!",round.guesses.first.feedback
  end

  def test_can_it_count_the_number_of_corrects
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    round.record_guess("Juneau")

    assert_equal 1,round.number_correct
  end
# => 1
# round.current_card
# => #<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">
# round.record_guess("2")
# => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">, @response="2">
# round.guesses.count
# => 2
# round.guesses.last.feedback
# => "Incorrect."
# round.number_correct
# => 1
# round.percent_correct
# => 50

end
