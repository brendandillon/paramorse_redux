module ParaMorse

  class LetterDecoder

    def decode(letter)
      if ALPHABET.has_value?(letter)
        return ALPHABET.key(letter)
      else
        return ""
      end
    end

  end

end
