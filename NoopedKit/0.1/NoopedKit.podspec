Pod::Spec.new do |s|
  s.name     = 'NoopedKit'
  s.version  = '0.1'
  s.summary  = 'Noop tool kit'
  s.homepage = 'https://github.com/depoon/NoopedKit'
  s.author  = { 'Kenneth Poon' => 'de_poon@hotmail.com' }
  s.source   = { :git => 'https://github.com/depoon/NoopedKit.git', :tag => "0.1", :submodules => false }
  s.requires_arc = true

  s.ios.deployment_target = '6.0'
  s.osx.deployment_target = '10.8'

  s.public_header_files = 'Classes/**/*.h'
  s.source_files = 'Classes/**/*.h'

  s.license = 'MIT'

end