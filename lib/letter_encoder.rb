module ParaMorse

  class LetterEncoder
    attr_reader :alphabet

    def initialize
      @alphabet = ParaMorse::Alphabet.new
    end

    def encode(letter)
      alphabet.trans_morse[letter.upcase]
    end
  end

end
