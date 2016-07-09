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

    def initialize
      @reader = FileReader.new
      @alphabet = Alphabet.new

    end

    def encoder
    end


  end


end
