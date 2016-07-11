require "minitest/pride"
require "minitest/autorun"
require "./lib/alphabet"
require "./lib/queue"
require "./lib/letter_encoder"
require "./lib/paramorse"
require 'simplecov'
SimpleCov.start


class LetterEncoderTest < Minitest::Test

  def test_class_letter_encoder_exists
    assert(ParaMorse::LetterEncoder)
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
