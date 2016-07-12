require_relative "alphabet"

module ParaMorse

  class Encoder
    attr_reader :alphabet

    def initialize
      @alphabet = Alphabet.new
    end

    def encode(phrase)
      phrase.upcase.each_char.map do |letter|
        alphabet.trans_morse[letter]
      end.join("000")
    end
  end

end
