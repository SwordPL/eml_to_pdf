# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eml_to_pdf_ext/version'

Gem::Specification.new do |spec|
  spec.name          = 'eml_to_pdf_ext'
  spec.version       = EmlToPdfExt::VERSION
  spec.authors       = ['Yves Siegrist', 'Hubert Pomorski']
  spec.email         = %w(Elektron1c97@gmail.com hubert.pomorski@sabre.com)

  spec.description   = %q{This gem uses wkhtmltopdf to convert an eml to a pdf. (eml -> html -> pdf)}
  spec.summary       = %q{This gem allows you to convert an eml (email) into a pdf.}
  spec.homepage      = 'https://github.com/SwordPL/eml_to_pdf'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.1.5'

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 11.0'
  spec.add_development_dependency 'minitest', '~> 5.9'

  spec.add_runtime_dependency 'filesize', '~> 0.1.1'
  spec.add_runtime_dependency 'mail', '~> 2.5', '>= 2.5.4'
  spec.add_runtime_dependency 'nokogiri', '>= 1.5.2'
end
