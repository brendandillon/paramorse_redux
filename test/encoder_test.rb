require_relative 'test_handler'

class EncoderTest < Minitest::Test

  def test_encode_a_word
    encoder = ParaMorse::Encoder.new
    assert_equal "1011101110001110111011100010111010001110101", encoder.encode("Word")
  end

  def test_encodes_multiple_words
    encoder = ParaMorse::Encoder.new
    assert_equal "101010100010100000001110001010101000100010111010001", encoder.encode("Hi there")
  end

end
