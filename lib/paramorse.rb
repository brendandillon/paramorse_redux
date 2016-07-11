require "pry"
require_relative "alphabet"

module ParaMorse

  class Queue
    attr_accessor :queue

    def initialize
      @queue = Array.new
    end

    def push(*element)
      element.map do |e|
        queue.push(e.upcase)
      end
      queue
    end

    def count
      queue.size
    end

    def peek(index = nil)
      return queue[0] if index == nil
      queue[0..(index - 1)]
    end

    def pop(number = nil)
      return queue.pop if number == nil
      queue.pop(number)
    end

    def tail(index = nil)
      return queue.last if index == nil
      queue[-index..- 1]
    end

    def clear
      queue.clear
    end
  end

  class LetterEncoder
    attr_reader :alphabet, :queue

    def initialize
      @alphabet = Alphabet.new
      @queue = Queue.new
    end

    def encode(queue)
      queue.dup.map! do |letter|
        alphabet.trans_morse[letter]
      end.pop
    end
  end

  class LetterDecoder
    attr_reader :alphabet, :queue

    def initialize
      @alphabet = Alphabet.new
      @queue = Queue.new.queue
    end

    def decode(queue)
      queue.dup.map! do |letter|
        alphabet.trans_morse.key(letter)
      end.pop
    end
  end

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
