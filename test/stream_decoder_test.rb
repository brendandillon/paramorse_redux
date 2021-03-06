require './test/test_handler'

class StreamDecoderTest < Minitest::Test

  def test_can_recieve_input
    stream = ParaMorse::StreamDecoder.new

    stream.receive("1")

    assert_equal ["1"], stream.queue
  end

  def test_can_recieve_multiple_inputs
    stream = ParaMorse::StreamDecoder.new

    stream.receive("1")
    stream.receive("0")
    stream.receive("1")

    assert_equal ["1", "0", "1"], stream.queue
  end

  def test_can_divide_words
    stream = ParaMorse::StreamDecoder.new

    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")
    stream.decode

    assert_equal ["1", "0", "1"], stream.letters
  end

  def test_can_divide_letters
    stream = ParaMorse::StreamDecoder.new

    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")
    stream.decode

    assert_equal ["1", "1"], stream.letters
  end

  def test_can_decode_one_streamed_word
    stream = ParaMorse::StreamDecoder.new

    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")

    assert_equal "HI", stream.decode
  end

  def test_can_decode_multiple_streamed_words
    stream = ParaMorse::StreamDecoder.new

    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")

    assert_equal "HI HE", stream.decode
  end

end
