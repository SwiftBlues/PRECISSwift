Pod::Spec.new do |s|
  s.name = 'PRECISSwift'
  s.version = '1.0.0'
  s.summary = 'A Swift implementation of PRECIS Framework.'
  s.description = <<-DESC
This library implements PRECIS profiles described in <https://tools.ietf.org/html/rfc7564> and provides tools for building your own.
DESC
  s.homepage = 'https://github.com/SwiftBlues/PRECISSwift'
  s.license = { :type => 'Apache 2.0', :file => 'LICENSE' }
  s.author = { 'Alexander Tovstonozhenko' => 'a.tovstonozhenko@mozidev.com' }
  s.source = { :git => 'https://github.com/SwiftBlues/PRECISSwift.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.9'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.0' 
  s.source_files = 'Sources/**/*'
end

