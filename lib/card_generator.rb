#require "pry"

class CardGenerator

    def initialize(file)
      @File = file

    end

    def file_reader
      file_import = File.read(@file)
      split_up = file_import.split("/n")
      binding.pry

    end


  end

  tester = CardGenerator.new("cards.txt")

  tester
