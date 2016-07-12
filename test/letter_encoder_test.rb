require_relative 'test_handler'

class LetterEncoderTest < Minitest::Test

  def test_class_letter_encoder_exists
    assert(ParaMorse::LetterEncoder)
  end

  def test_encode_one_letter
    letter_encoder = ParaMorse::LetterEncoder.new
    assert_equal "10111", letter_encoder.encode("a")
  end

  def test_encode_one_different_letter_from_previous_example
    letter_encoder = ParaMorse::LetterEncoder.new
    assert_equal "1110111010111", letter_encoder.encode("q")
  end

end
