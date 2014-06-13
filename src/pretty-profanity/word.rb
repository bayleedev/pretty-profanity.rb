module PrettyProfanity

  class Word

    attr_accessor :word, :whitelist

    def initialize(word)
      @word = word
      @whitelist = Profanity.whitelist
    end

    def to_regex
      /#{before_regex}\b(#{word})\b#{after_regex}/i
    end

    def before_regex
      words = whitelist(/^#{word}/)
      "(?!#{words.join('|')})" unless words.empty?
    end

    def after_regex
      words = whitelist(/#{word}$/)
      "(?<!#{words.join('|')})" unless words.empty?
    end

    def whitelist(word)
      @whitelist.grep(word)
    end

  end

end
