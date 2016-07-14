module ParaMorse

  class ParallelEncoder

    def initialize
      @letter_encoder = ParaMorse::LetterEncoder.new
    end

    def encode_from_file(input_location, number_of_files, output_location)
      letters_to_encode = get_letters_to_encode(input_location)
      encoded_text = sort_letters_into_files(number_of_files, letters_to_encode)
      save_translation_to_files(encoded_text, output_location)
    end

    def get_letters_to_encode(input_location)
      text_to_encode = File.read(input_location)
      letters_to_encode = text_to_encode.split("")
      return letters_to_encode
    end

    def sort_letters_into_files(number_of_files, letters_to_encode)
      encoded_text = Array.new(number_of_files) { Array.new }
      letters_to_encode.each.with_index do |letter, index|
        current_file = (index + number_of_files) % number_of_files
        encoded_text[current_file] << @letter_encoder.encode(letter)
        encoded_text[current_file] << "000"
      end
      return encoded_text
    end

    def save_translation_to_files(encoded_text, output_location)
      encoded_text.each.with_index do |encoded, index|
        this_output_location = output_location.sub("*", "%02d" % index.to_s )
        this_out_file = File.new(this_output_location, "w")
        this_out_file.print(encoded.join)
        this_out_file.close
      end
    end

  end

end
