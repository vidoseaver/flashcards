gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess.rb'
require_relative "../lib/card.rb"

class GuessTest < MiniTest::Test
  def setup
    @card = Card.new("What is the capital of Alaska?", "Juneau")
    @guess = Guess.new("Juneau", @card)
    @guess2 = Guess.new("Saturn", @card)
  end

  def test_card_equals_guess_card

    assert_equal @card, @guess.card
  end

  def test_user_guess_equals_guess_response

    assert_equal "Juneau", @guess.response
  end

  def test_true_if_card_answer_equals_guess_response

    assert_equal true, @guess.correct?
  end

  def test_feedback_is_correct_when_true

    assert_equal "Correct!", @guess.feedback
  end

  def test_false_if_card_answer_does_not_equal_guess_response

    assert_equal false, @guess2.correct?
  end

  def test_feedback_is_incorrect_when_false

    assert_equal "Incorrect!", @guess2.feedback
  end


end
