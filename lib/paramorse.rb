require "pry"
require_relative "alphabet"
require_relative "queue"
require_relative "letter_encoder"

#streamer will receive one character at a time
#will store in an Array
#when decode is called, it will either return the word (or letter)
#or it wil return an error message "it is not a word and will ask another input"

module ParaMorse

  class Encoder
    attr_reader :alphabet

    def initialize
      @alphabet = Alphabet.new
    end

    def encode(word)
      word.upcase.each_char.map do |letter|
        alphabet.trans_morse[letter]
      end.join("000")
    end

  end

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
