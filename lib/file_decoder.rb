module ParaMorse

  class FileDecoder
    attr_reader :text_to_decode

    def initialize
      @text_to_decode
      @decoder = ParaMorse::Decoder.new
    end

    def decode(input_location, output_location)
      @text_to_decode = File.read(input_location)
      decoded_text = @decoder.decode(@text_to_decode)
      out_file = File.new(output_location, "w")
      out_file.print(decoded_text)
      out_file.close
    end

    def count
      @text_to_decode.length
    end
  end

end
