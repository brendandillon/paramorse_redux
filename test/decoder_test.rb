require './test/test_handler'


class DecoderTest < Minitest::Test

  def test_decode_a_word
    decoder = ParaMorse::Decoder.new
    assert_equal "WORD", decoder.decode("1011101110001110111011100010111010001110101")
  end

  def test_decodes_multiple_words
    decoder = ParaMorse::Decoder.new
    assert_equal "HI THERE", decoder.decode("101010100010100000001110001010101000100010111010001")

  end

end
