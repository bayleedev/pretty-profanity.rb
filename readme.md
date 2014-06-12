## Pretty Pirate
For pirates who don't want to curse like one.


## Setup
~~~ ruby
PrettyPirate::Pirate.configure do |config|
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


## Creating Custom Replacements
To create your own sanitization rules, open the class up, add your method and add it to your configuration.
~~~ ruby
class Sanitize
  def reverse(word)
    word.downcase.reverse
  end
end
PrettyPirate::Pirate.configure do |config|
  # ...
  config.replacement = :reverse
end
~~~
