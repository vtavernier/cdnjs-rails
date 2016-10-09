Gem::Specification.new do |s|
  s.authors           = ["jasonleonhard"]
  s.email             = ["devbrights@gmail.com"]
  s.description       = %q{Use the CDNJS CDN to serve files and fall back to the local version if the CDN is unreachable.}
  s.summary           = %q{A gem to serve CDNJS files with fall back protection.}
  s.homepage          = "https://github.com/jasonleonhard/cdnjs-rails"
  s.files             = `git ls-files`.split("\n")
  s.require_paths     = ["lib"]
  s.name              = "cdnjs-rails"
  s.licenses          = "GPL"
  s.version           = '1.0.2'
end
