require './test/test_handler'

class ParallelDecoderTest < Minitest::Test

  def test_it_reads_one_file
    parallel_decoder = ParaMorse::ParallelDecoder.new
    in_file = File.new("in_file00.txt", "w")

    in_file.print("hello")
    in_file.close
    parallel_decoder.decode_from_files(1, "in_file*.txt", "out_file.txt")

    assert_equal ["hello"], parallel_decoder.access_input_files(1, "in_file*.txt")
  end

  def test_it_writes_to_a_file
    parallel_decoder = ParaMorse::ParallelDecoder.new
    in_file = File.new("in_file00.txt", "w")

    in_file.print("hello")
    in_file.close
    parallel_decoder.decode_from_files(1, "in_file*.txt", "out_file.txt")
    out_file = File.read("out_file.txt")

    assert_equal String, out_file.class
  end

  def test_it_writes_translation_to_a_file
    parallel_decoder = ParaMorse::ParallelDecoder.new
    in_file = File.new("in_file00.txt", "w")

    in_file.print("1011101110001110111011100010111010001110101000")
    in_file.close
    parallel_decoder.decode_from_files(1, "in_file*.txt", "out_file.txt")
    out_file = File.read("out_file.txt")

    assert_equal "WORD", out_file
  end

  def test_it_writes_translation_to_multiple_files
    parallel_decoder = ParaMorse::ParallelDecoder.new
    in_file1 = File.new("in_file00.txt", "w")
    in_file2 = File.new("in_file01.txt", "w")

    in_file1.print("1011101110001011101000")
    in_file2.print("111011101110001110101000")
    in_file1.close
    in_file2.close
    parallel_decoder.decode_from_files(2, "in_file*.txt", "out_file.txt")
    out_file = File.read("out_file.txt")

    assert_equal "WORD", out_file
  end


end
