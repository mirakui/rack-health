Gem::Specification.new do |spec|
  spec.name              = 'rack-health'
  spec.version           = '0.1.0'
  spec.summary           = 'summary'
  spec.description       = 'description'
  spec.files             = Dir.glob("lib/**/*.rb")
  spec.author            = 'Issei Naruta'
  spec.email             = 'naruta@cookpad.com'
  spec.homepage          = 'https://github.com/mirakui/rack-health'
  spec.has_rdoc          = false
  spec.add_dependency 'rack', '>= 1.2.0'
  spec.add_development_dependency 'rspec', '>= 2.0.0'
end
