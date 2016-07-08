gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess.rb'
require_relative "../lib/card.rb"

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
