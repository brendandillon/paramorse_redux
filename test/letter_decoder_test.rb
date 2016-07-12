require_relative 'test_handler'

class LetterDecoderTest < Minitest::Test

  def test_decode_one_letter
    letter_decoder = ParaMorse::LetterDecoder.new
    assert_equal "A", letter_decoder.decode("10111")
  end

  def test_decode_a_different_letter
    letter_decoder = ParaMorse::LetterDecoder.new
    assert_equal "Q", letter_decoder.decode("1110111010111")
  end

end
