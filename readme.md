## Pretty Profanity
Cleans up profanity in text.

[![Build Status](https://travis-ci.org/blainesch/pretty-profanity.rb.svg?branch=master)](https://travis-ci.org/blainesch/pretty-profanity.rb)
[![Code Climate](https://codeclimate.com/github/blainesch/pretty-profanity.rb.png)](https://codeclimate.com/github/blainesch/pretty-profanity.rb)

## Setup
~~~ ruby
PrettyProfanity::Profanity.configure do |config|
  config.blacklist = ['foo', 'bar']
  config.whitelist = ['foo baz']
  config.replacement = :vowels
end
~~~

### Blacklist
Whole words (or phrases) that you wish to remove. Because this requires whole words you'll need to add both `foo` and `foobaz`. The first will not match the second.

### Whitelist
Phrases that contain a word from the whitelist that you do not wish to remove. For instance you might blacklist `foo` but `foo baz` is acceptable.

### Replacements
Different replacements do different things. For instance the `:vowel` replacement just replaces vowels with stars, where the `:none` just deletes the word.
* `:none` - Deletes the entire word.
* `:star` - Stars the entire word.
* `:vowels` - Stars just the vowels.
* `:garbled` - Replaces each letter with garbled text `$@!#%`.
* `:L337` - Replaces every character with 1337 speak.
* `:piglatin` - Converts word to piglatin.

## Creating Custom Replacements
To create your own sanitization rules, open the class up, add your method and add it to your configuration.
~~~ ruby
class Sanitize
  def reverse(word)
    word.downcase.reverse
  end
end
PrettyProfanity::Profanity.configure do |config|
  # ...
  config.replacement = :reverse
end
~~~
