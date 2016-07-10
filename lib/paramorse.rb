require "pry"
require_relative "alphabet"
require_relative "file_reader"

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
      queue.dup.map! do |letter|
        alphabet.trans_morse[letter]
      end.pop.join
    end
  end
end
