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
      element = element.upcase.chars
      @queue.push(element)
    end

    def count
      @queue.size
    end

    def pop
      @queue.pop
    end

  end

  class LetterEncoder

    attr_reader :alphabet, :queue

    def initialize
      @reader = FileReader.new
      @alphabet = Alphabet.new
      @queue = Queue.new.queue
    end

    def encode(queue)
      sorted_queue = queue.pop
      translated_morse = []
      sorted_queue.each do |letter|
      translated_morse << @alphabet.trans_morse[letter]
      end
      translated_morse.pop.join
    end

  end


end
