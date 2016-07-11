require "minitest/pride"
require "minitest/autorun"
require 'simplecov'
SimpleCov.start
require "./lib/paramorse"

class ParaMorseTest < Minitest::Test

  def test_class_paramorse_exists
    assert(ParaMorse)
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
