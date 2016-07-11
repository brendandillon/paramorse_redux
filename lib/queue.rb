

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
    end

    def peek_multiple(index = nil)
      return queue[0] if index == nil
      queue[0..(index - 1)]
    end

    def pop(number = nil)
      return queue.pop if number == nil
    end

    def pop_multiple(number = nil)
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

end
