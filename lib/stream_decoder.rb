module ParaMorse

  class StreamDecoder
    attr_reader :letters

    def initialize
      @queue = ParaMorse::Queue.new
      @letter_decoder = ParaMorse::LetterDecoder.new
      @letters = []
    end

    def receive(recieved_data)
      @queue.push(recieved_data)
      parse
    end

    def parse
      if @queue.tail(3) == ["0", "0", "0"]
        @letters << @queue.pop(@queue.count - 3).join
        @queue.clear
      elsif @queue.peek == "0" && @queue.tail == "1"
        @letters << @queue.pop
      end
    end

    def access_final_letter
      @letters << @queue.pop(@queue.count).join
      @queue.clear
    end

    def decode
      access_final_letter
      @letters.delete("")
      output = ""
      @letters.each do |letter|
        output << @letter_decoder.decode(letter)
      end
      return output
    end

    def queue
      @queue.queue
    end

  end

end
