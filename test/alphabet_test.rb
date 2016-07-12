require_relative 'test_handler'

class AlphabetTest < Minitest::Test

  def test_class_alphabet_exists
    assert(ParaMorse::Alphabet)
  end

  def test_has_all_letters_in_trans_morse
    alpha = ParaMorse::Alphabet.new
    assert_equal 37, alpha.trans_morse.count
  end

  def test_has_key_and_values
    alpha = ParaMorse::Alphabet.new
    assert_equal "10111", alpha.trans_morse["A"]
  end

end
