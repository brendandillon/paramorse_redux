require "pry"
require_relative "alphabet"
require_relative "file_reader"

module ParaMorse

  class Queue

    attr_accessor :queue

    def initialize
      @reader = FileReader.new
      @alphabet = Alphabet.new
      @queue = Array.new
    end

    def pop
      @queue.pop
    end

    def push(element)
      @queue.push(element)
      self
    end

    def size
      @queue.size
    end

  end

end
