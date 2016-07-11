require "minitest/pride"
require "minitest/autorun"
require "./lib/alphabet"
require "./lib/queue"
require "./lib/letter_encoder"
require "./lib/letter_decoder"
require "./lib/paramorse"
require 'simplecov'
SimpleCov.start

class LetterDecoderTest < Minitest::Test

  def test_decode_one_letter
    q = ParaMorse::Queue.new
    q.push("10111")
    letter_decoder = ParaMorse::LetterDecoder.new
    assert_equal "A", letter_decoder.decode(q.queue)
  end

  def test_decode_a_different_letter
    q = ParaMorse::Queue.new
    q.push("1110111010111")
    letter_decoder = ParaMorse::LetterDecoder.new
    assert_equal "Q", letter_decoder.decode(q.queue)
  end

end
