require "minitest/pride"
require "minitest/autorun"
require 'simplecov'
SimpleCov.start
require "./lib/paramorse"

class ParaMorseTest < Minitest::Test

  def test_class_paramorse_exists
    assert(ParaMorse)
  end

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

  def test_encode_a_word
    encoder = ParaMorse::Encoder.new
    assert_equal "1011101110001110111011100010111010001110101", encoder.encode("Word")
  end

  def test_decode_a_word
    decoder = ParaMorse::Decoder.new
    assert_equal "WORD", decoder.decode("1011101110001110111011100010111010001110101")
  end

end
