require_relative "alphabet"
require_relative "queue"

module ParaMorse

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

end
