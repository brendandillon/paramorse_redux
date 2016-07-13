require_relative 'test_handler'

class InstantNoodlesTest < Minitest::Test
  def test_can_recieve_input
    stream = ParaMorse::InstantNoodles.new

    stream.receive("1")

    assert_equal ["1"], stream.queue
  end

  def test_can_recieve_multiple_inputs
    stream = ParaMorse::InstantNoodles.new

    stream.receive("1")
    stream.receive("0")
    stream.receive("1")

    assert_equal ["1", "0", "1"], stream.queue
  end

  def test_can_divide_words
    stream = ParaMorse::InstantNoodles.new

    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    assert_equal "1", stream.current_letter

    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("1")
    assert_equal "0", stream.current_letter

    assert_equal "E", stream.decode
  end

  def test_can_divide_letters
    stream = ParaMorse::InstantNoodles.new

    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    assert_equal "1", stream.current_letter

    stream.receive("1")
    assert_equal "E", stream.decode
  end

  def test_can_decode_one_streamed_word
    stream = ParaMorse::InstantNoodles.new

    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    assert_equal "H", stream.receive("0")
    
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    assert_equal "I", stream.decode
  end

  def test_can_decode_multiple_streamed_words
    stream = ParaMorse::InstantNoodles.new

    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    assert_equal "H", stream.receive("0")

    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    assert_equal "I", stream.receive("0")

    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    stream.receive("0")
    assert_equal " ", stream.receive("1")

    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("1")
    stream.receive("0")
    stream.receive("0")
    assert_equal "H", stream.receive("0")

    stream.receive("1")
    assert_equal "E", stream.decode
  end

end
