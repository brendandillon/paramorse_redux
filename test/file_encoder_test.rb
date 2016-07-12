require_relative 'test_handler'

class FileEncoderTest < Minitest::Test

  def test_it_reads_a_file
    file_enc = ParaMorse::FileEncoder.new
    in_file = File.new("in_file.txt", "w")

    in_file.print("hello")
    in_file.close
    file_enc.encode("in_file.txt", "out_file.txt")

    assert_equal "hello", file_enc.text_to_encode
  end

  def test_it_counts_file_length
    file_enc = ParaMorse::FileEncoder.new
    in_file = File.new("in_file.txt", "w")

    in_file.print("hello")
    in_file.close
    file_enc.encode("in_file.txt", "out_file.txt")

    assert_equal 5, file_enc.count
  end

  def test_it_writes_to_a_file
    file_enc = ParaMorse::FileEncoder.new
    in_file = File.new("in_file.txt", "w")

    in_file.print("hello")
    in_file.close
    file_enc.encode("in_file.txt", "out_file.txt")
    out_file = File.read("out_file.txt")

    assert_equal String, out_file.class
  end

  def test_it_writes_translation_to_a_file
    file_enc = ParaMorse::FileEncoder.new
    in_file = File.new("in_file.txt", "w")

    in_file.print("word")
    in_file.close
    file_enc.encode("in_file.txt", "out_file.txt")
    out_file = File.read("out_file.txt")

    assert_equal "1011101110001110111011100010111010001110101", out_file
  end

end
