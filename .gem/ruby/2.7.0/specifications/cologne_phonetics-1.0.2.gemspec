# -*- encoding: utf-8 -*-
# stub: cologne_phonetics 1.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "cologne_phonetics".freeze
  s.version = "1.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Stefan Daschek".freeze]
  s.bindir = "exe".freeze
  s.date = "2018-03-15"
  s.description = "The Cologne phonetics (also K\u00F6lner Phonetik, Cologne process) algorithm encodes words in a way that enables to search for similarly sounding words. It\u2019s related to Soundex and Metaphone, but better suited for the German language.".freeze
  s.email = ["stefan@die-antwort.eu".freeze]
  s.homepage = "https://github.com/die-antwort/cologne_phonetics".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Cologne phonetics (K\u00F6lner Phonetik) text encoding algorithm".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 1.15"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.6"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.52.1"])
    s.add_development_dependency(%q<yard>.freeze, ["~> 0.9.12"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 1.15"])
    s.add_dependency(%q<rake>.freeze, ["~> 10.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.6"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.52.1"])
    s.add_dependency(%q<yard>.freeze, ["~> 0.9.12"])
  end
end
