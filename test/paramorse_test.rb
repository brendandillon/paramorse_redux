require "minitest/pride"
require "minitest/autorun"
require 'simplecov'
SimpleCov.start
require "./lib/paramorse"

class ParaMorseTest < Minitest::Test


  def test_queue_pushes_one_morse_binary_number
    q = ParaMorse::Queue.new
    assert_equal ["1"], q.push("1")
  end

  def test_queue_pushes_multiple_morse_binary_number
    q = ParaMorse::Queue.new
    assert_equal ["1","0","1","1","1"], q.push("1","0","1","1","1")
  end

  def test_queue_counts_one_number
    q = ParaMorse::Queue.new
    q.push("1")
    assert_equal 1, q.count
  end

  def test_queue_counts_multiple_number
    q = ParaMorse::Queue.new
    q.push("1","0","1","1","1")
    assert_equal 5, q.count
  end

  def test_queue_peeks_one_char
    q = ParaMorse::Queue.new
    q.push("1","0","1","1","1")
    assert_equal "1", q.peek
  end

  def test_peeks_multiple_chars
    q = ParaMorse::Queue.new
    q.push("1","0","1","1","1")
    assert_equal ["1", "0", "1"], q.peek(3)
  end

  def test_peeks_mult_chars_and_queue_remains_the_same
    q = ParaMorse::Queue.new
    q.push("1","0","1","1","1")
    assert_equal ["1", "0", "1"], q.peek(3)
    assert_equal 5, q.count
  end

  def test_queue_pops_one_number_out
    q = ParaMorse::Queue.new
    q.push("1","0","1","1","1")
    assert_equal "1", q.pop
  end

  def test_queue_pops_multiple_numbers_out
    q = ParaMorse::Queue.new
    q.push("1","0","1","1")
    assert_equal ["0", "1", "1"], q.pop(3)
  end

  def test_return_tail_of_the_queue
    q = ParaMorse::Queue.new
    q.push("3")
    assert_equal "3", q.tail
  end

  def test_return_mult_tails_of_the_queue
    q = ParaMorse::Queue.new
    q.push("0","1","2","3")
    assert_equal ["2", "3"], q.tail(2)
  end

  def test_clear_queue
    q = ParaMorse::Queue.new
    q.push("1","0","1","1")
    q.clear
    assert_equal 0, q.count
  end

  def test_encode_one_letter
    q = ParaMorse::Queue.new
    q.push("a")
    letter_encoder = ParaMorse::LetterEncoder.new
    assert_equal "10111", letter_encoder.encode(q.queue)
  end

  def test_encode_one_different_letter_from_previous_example
    q = ParaMorse::Queue.new
    q.push("q")
    letter_encoder = ParaMorse::LetterEncoder.new
    assert_equal "1110111010111", letter_encoder.encode(q.queue)
  end

end
