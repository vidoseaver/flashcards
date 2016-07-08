require "pry"

class Card
  attr_reader :question, :answer

  def initialize(question, answer)
    @question = question
    @answer = answer
  end
end

class Guess
  attr_reader :user_answer, :card

  def initialize(user_answer, card)
    @user_answer = user_answer
    @card = card
  end

  def correct?
    if @user_answer == @card.answer
      true
    else
      false
    end
  end

  def response
    @user_answer
  end

  def feedback
    if @user_answer == @card.answer
      "Correct!"
    else
      "Incorrect."
    end
  end
end

class Deck
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def count
    @cards.length
  end
end

class Round
  attr_reader :deck, :guesses, :number_correct

  def initialize(deck)
    @deck =  deck
    @guesses = []
    @number_correct = 0
    @current_card = 0
  end

  def current_card
    @current_card 
  end

  def record_guess(user_answer)
    @guesses <<  Guess.new(user_answer, current_card)

    if  @guesses.last.correct?
      @number_correct += 1
    end
    @guesses.last
  end
end
