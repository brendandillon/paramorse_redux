module ParaMorse

  class LetterDecoder
    attr_reader :alphabet

    def initialize
      @alphabet = Alphabet.new
    end

    def decode(letter)
      alphabet.trans_morse.key(letter)
    end
  end

end
