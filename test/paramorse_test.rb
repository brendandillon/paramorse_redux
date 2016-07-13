require './test/test_handler'

class ParaMorseTest < Minitest::Test

  def test_class_paramorse_exists
    assert(ParaMorse)
  end

  def test_alphabet_exists
    assert(ParaMorse::ALPHABET)
  end

  def test_has_all_letters_in_alphabet
    assert_equal 37, ParaMorse::ALPHABET.count
  end

  def test_has_key_and_values
    assert_equal "10111", ParaMorse::ALPHABET["A"]
  end
  
end
