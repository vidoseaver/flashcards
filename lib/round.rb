require_relative "guess.rb"
require_relative "deck.rb"
require_relative "card.rb"
require "pry"

class Round
  attr_reader :deck, :guesses, :number_correct

  def initialize(deck)
    @deck =  deck
    @guesses = []
    @number_correct = 0
  end

  def current_card
    @deck.cards[@guesses.length]

  end

  def record_guess(user_answer)
    #push the guess into guesses

    @guesses << Guess.new(user_answer,current_card)
    @guesses.last
  end

  def count
    @guesses.length
  end

  def number_correct
    @number_correct = @guesses.find_all do |guess|
      guess.correct?
    end
    @number_correct.length
  end
  def percent_correct

    (number_correct.to_f/@guesses.length) * 100
  end
end
