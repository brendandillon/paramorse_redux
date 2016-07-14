require './test/test_handler'

class ParallelEncoderTest < Minitest::Test

  def test_it_reads_a_file
    parallel_encoder = ParaMorse::ParallelEncoder.new
    in_file = File.new("in_file.txt", "w")

    in_file.print("hello")
    in_file.close
    parallel_encoder.encode_from_file("in_file.txt", 1, "out_file*.txt")

    assert_equal ["h", "e", "l", "l", "o"], parallel_encoder.get_letters_to_encode(in_file)
  end

  def test_it_writes_to_a_file
    parallel_encoder = ParaMorse::ParallelEncoder.new
    in_file = File.new("in_file.txt", "w")

    in_file.print("hello")
    in_file.close
    parallel_encoder.encode_from_file("in_file.txt", 1, "out_file*.txt")
    out_file = File.read("out_file00.txt")

    assert_equal String, out_file.class
  end

  def test_it_writes_to_multiple_files
    parallel_encoder = ParaMorse::ParallelEncoder.new
    in_file = File.new("in_file.txt", "w")

    in_file.print("hello")
    in_file.close
    parallel_encoder.encode_from_file("in_file.txt", 2, "out_file*.txt")
    out_file1 = File.read("out_file00.txt")
    out_file2 = File.read("out_file01.txt")


    assert_equal String, out_file1.class
    assert_equal String, out_file2.class
  end

  def test_it_writes_translation_to_a_file
    parallel_encoder = ParaMorse::ParallelEncoder.new
    in_file = File.new("in_file.txt", "w")

    in_file.print("word")
    in_file.close
    parallel_encoder.encode_from_file("in_file.txt", 1, "out_file*.txt")
    out_file = File.read("out_file00.txt")

    assert_equal "1011101110001110111011100010111010001110101000", out_file
  end

  def test_it_writes_translation_to_multiple_files
    parallel_encoder = ParaMorse::ParallelEncoder.new
    in_file = File.new("in_file.txt", "w")

    in_file.print("word")
    in_file.close
    parallel_encoder.encode_from_file("in_file.txt", 2, "out_file*.txt")
    out_file1 = File.read("out_file00.txt")
    out_file2 = File.read("out_file01.txt")

    assert_equal "1011101110001011101000", out_file1
    assert_equal "111011101110001110101000", out_file2
  end

end
