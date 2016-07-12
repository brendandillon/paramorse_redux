require_relative "alphabet"

module ParaMorse

  class Decoder
    attr_reader :alphabet

    def initialize
      @alphabet = Alphabet.new
    end

    def decode(binary_input)
      words = binary_input.split("0000000")
      output = words.map do |word|
        word.split("000").map do |letter|
          alphabet.trans_morse.key(letter)
        end.join
      end.join(" ")
    end
  end

end
