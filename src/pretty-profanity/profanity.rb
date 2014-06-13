module PrettyProfanity

  class Profanity

    class << self

      attr_accessor :whitelist, :blacklist, :replacement

      def configure
        yield(self)
      end

      def profane?(text)
        text = text.to_s
        !!blacklist.detect do |word|
          true if text.match(Word.new(word).to_regex)
        end
      end

      def sanitize(text)
        text = text.to_s
        cleanse = Sanitize.new
        blacklist.each do |word|
          text.gsub!(Word.new(word).to_regex, cleanse.send(replacement, word))
        end
        text
      end

      def offensive(text)
        text = text.to_s
        blacklist.select do |word|
          true if text.match(Word.new(word).to_regex)
        end
      end

    end

  end

end
