gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/guess.rb'
require_relative "../lib/card.rb"
require_relative "../lib/deck.rb"
require_relative "../lib/card_generator.rb"



class CardGenerator < MiniTest::Test
  filename = "lib/cards.txt"
  cards = CardGenerator.new(filename.cards)
  def test_it_reads
