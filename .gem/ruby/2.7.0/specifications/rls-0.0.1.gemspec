# -*- encoding: utf-8 -*-
# stub: rls 0.0.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rls".freeze
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jesper Kjeldgaard".freeze]
  s.date = "2012-12-22"
  s.description = "All in one deploy command for Heroku apps".freeze
  s.email = ["thejspr@gmail.com".freeze]
  s.executables = ["rls".freeze]
  s.files = ["bin/rls".freeze]
  s.homepage = "http://github.com/thejspr/rls".freeze
  s.rubygems_version = "3.1.4".freeze
  s.summary = "Heroku deploy wrapper".freeze

  s.installed_by_version = "3.1.4" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 3
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_runtime_dependency(%q<trollop>.freeze, ["~> 2.0"])
  else
    s.add_dependency(%q<trollop>.freeze, ["~> 2.0"])
  end
end
