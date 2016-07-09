require "pry"
require_relative "alphabet"
require_relative "file_reader"

module ParaMorse

  class Queue

    attr_accessor :queue

    def initialize
      @queue = Array.new
    end

    def push(element)
      @queue.push(element)
      self
    end

    def count
      @queue.size
    end

    def pop
      @queue.pop
    end

  end

  class LetterEncoder

    attr_reader :alphabet

    def initialize
      @reader = FileReader.new
      @alphabet = Alphabet.new
    end

    def encode(word)
      something = Array.new.push(word)
      translated_morse = []
      something.each do |letter|
        if letter == letter.upcase && letter != letter.downcase
          translated_morse << alphabet.trans_morse[letter.downcase]
        else
          translated_morse << alphabet.trans_morse[letter]
        end
      end
      translated_morse.join
    end

  end


end
