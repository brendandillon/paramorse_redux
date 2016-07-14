module ParaMorse
  class InstantNoodles
    attr_reader :current_letter

    def initialize
      @queue = ParaMorse::Queue.new
      @letter_decoder = ParaMorse::LetterDecoder.new
    end

    def receive(recieved_data)
      @current_letter = ""
      @queue.push(recieved_data)
      parse
      return @letter_decoder.decode(@current_letter)
    end

    def parse
      if @queue.tail(3) == ["0", "0", "0"]
        @current_letter = @queue.pop(@queue.count - 3).join.reverse
        @queue.clear
      elsif @queue.peek == "0" && @queue.tail == "1"
        @current_letter = @queue.pop
      end
    end

    def access_final_letter
      @current_letter = @queue.pop(@queue.count).join.reverse
      @queue.clear
    end

    def decode
      access_final_letter
      return @letter_decoder.decode(@current_letter)
    end

    def queue       # only used for testing
      @queue.queue
    end

  end

end
