require_relative "card.rb"
require_relative "guess.rb"
require_relative "deck.rb"
require_relative "round.rb"



card_1 = Card.new("a","b")
card_2 = Card.new("c","d")
card_3 = Card.new("e","f")
card_4 = Card.new("g","h")
card_5 = Card.new("i","k")

deck = Deck.new([card_1, card_2, card_3, card_4])


round = Round.new(deck)

round.start
