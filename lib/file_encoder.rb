module ParaMorse

  class FileEncoder
    attr_reader :text_to_encode

    def initialize
      @text_to_encode
      @encoder = ParaMorse::Encoder.new
    end

    def encode(input_location, output_location)
      @text_to_encode = File.read(input_location)
      encoded_text = @encoder.encode(@text_to_encode)
      out_file = File.new(output_location, "w")
      out_file.print(encoded_text)
      out_file.close
    end

    def count
      @text_to_encode.length
    end
  end

end
