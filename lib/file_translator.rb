require 'pry'
require_relative "file_reader"
require_relative "night_writer"

  input   = FileReader.read(ARGV[0])
  file    = ParaMorse.new
  braille = file.encode_to_morse(input)
            File.write(ARGV[1], morse)