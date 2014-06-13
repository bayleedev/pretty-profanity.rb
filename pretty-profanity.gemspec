Gem::Specification.new do |s|
  s.authors       = 'Blaine Schmeisser'
  s.name          = 'pretty-profanity'
  s.email         = 'blainesch@gmail.com'
  s.homepage      = 'https://github.com/blainesch/pretty-profanity.rb'
  s.version       = '0.0.2'
  s.summary       = 'Cleans up profanity in text.'
  s.description   = 'Cleans up profanity in text with blacklist, whitelists, and multiple types of sanitization rules. Easily add new sanitization rules.'
  s.licenses      = ['MIT']
  s.require_paths = ['src']
  s.files         = `git ls-files`.split("\n")
  s.has_rdoc      = false
end
