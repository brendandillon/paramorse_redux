require "minitest/pride"
require "minitest/autorun"
require "./lib/paramorse"
require 'simplecov'
SimpleCov.start

class DecoderTest < Minitest::Test

  def test_decode_a_word
    decoder = ParaMorse::Decoder.new
    assert_equal "WORD", decoder.decode("1011101110001110111011100010111010001110101")
  end

end
