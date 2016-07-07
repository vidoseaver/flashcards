gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/card.rb'

class TestCard < MiniTest::Test

  def test_it_has_a_question
    card = Card.new("question?","answer!")

    assert_equal "question?", card.question
  end

  def test_it_has_an_answer
    card = Card.new("question?","answer!")

    assert_equal "answer!", card.answer
  end


end
