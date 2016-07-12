require_relative "alphabet"

module ParaMorse

  class LetterEncoder
    attr_reader :alphabet

    def initialize
      @alphabet = Alphabet.new
    end

    def encode(letter)
      alphabet.trans_morse[letter.upcase]
    end
  end

end
