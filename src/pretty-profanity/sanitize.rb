module PrettyProfanity

  class Sanitize

    def none(word)
      ''
    end

    def vowels(word)
      word.gsub(/[aeiou]/, '*')
    end

    def star(word)
      '*' * word.length
    end

  end

end
