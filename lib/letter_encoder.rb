module ParaMorse

  class LetterEncoder
    attr_reader :alphabet, :queue

    def initialize
      @alphabet = Alphabet.new
      @queue = Queue.new.queue
    end

    def encode(queue)
      queue.dup.map! do |letter|
        alphabet.trans_morse[letter]
      end.pop
    end
  end

end
