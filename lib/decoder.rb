
module ParaMorse

  class Decoder
    attr_reader :alphabet

    def initialize
      @alphabet = Alphabet.new
    end

    def decode(binary_input)
      binary_input.split("000").map do |letter|
        alphabet.trans_morse.key(letter)
      end.join
    end
  end

end
