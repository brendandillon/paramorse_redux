module ParaMorse

  class ParallelDecoder

    def initialize
      @instant_noodles = ParaMorse::InstantNoodles.new
    end

    def decode_from_files(number_of_files, input_location, output_location)
      @decoded_files = Array.new(number_of_files) { Array.new }
      all_files = access_input_files(number_of_files, input_location)
      decode_files(all_files)
      decoded_text = format_decoded_files
      output_files(output_location, decoded_text)
    end

    def access_input_files(number_of_files, input_location)
      all_files = []
      number_of_files.times do |index|
        this_input_location = input_location.sub("*", "%02d" % index.to_s)
        all_files << File.read(this_input_location)
      end
      return all_files
    end

    def decode_files(all_files)
      all_files.each.with_index do |file, index|
        file.each_char do |chr|
          to_add = ""
          to_add = @instant_noodles.receive(chr)
          if to_add != ""
            @decoded_files[index] << to_add
          end
        end
      end
    end

    def format_decoded_files
      decoded_text = @decoded_files[0].zip(*@decoded_files[1..-1]).join
    end

    def output_files(output_location, decoded_text)
      output = File.new(output_location, "w")
      output.print(decoded_text)
      output.close
    end

  end

end
