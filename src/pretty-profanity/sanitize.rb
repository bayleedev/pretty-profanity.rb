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

    def garbled(word)
      text = '$@!#%'
      word.length.times do |i|
        word[i] = text[rand(0..(text.length-1))]
      end
      word
    end

    def hollow(word)
      word[1,word.length-2] = '*' * (word.length - 2)
      word
    end

    def L337(word)
      letters = %w(4 B \( D 3 Ph 9 |-| 1 j |< L |V| |V 0 P Q R 5 7 U V VV >< '/ Z)
      word.split('').map { |letter, index|
        letters[letter.ord - 97]
      }.join
    end

    def piglatin(word)
      if word.match(/^[aeiou]/)
        word + 'way'
      else
        word.gsub(/^([^aeiou]+)(.+)$/, '\2\1') + 'ay'
      end
    end

  end

end
