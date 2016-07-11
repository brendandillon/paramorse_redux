require "minitest/pride"
require "minitest/autorun"
require "./lib/encoder"
require "./lib/alphabet"
require 'simplecov'
SimpleCov.start


class EncoderTest < Minitest::Test

  def test_encode_a_word
    encoder = ParaMorse::Encoder.new
    assert_equal "1011101110001110111011100010111010001110101", encoder.encode("Word")
  end

end
