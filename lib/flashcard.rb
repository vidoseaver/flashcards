

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
