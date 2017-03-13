Pod::Spec.new do |s|
  s.name = 'PRECISSwift'
  s.version = '1.0.0'
  s.summary = 'A Swift implementation of PRECIS framework.'
  s.description = <<-DESC
This is a Swift implementation of a framework that enables application protocols to perform the preparation, enforcement, and comparison of internationalized strings ("PRECIS") in a way that depends on the properties of Unicode characters and thus is agile with respect to versions of Unicode. As a result, this framework provides a more sustainable approach to the handling of internationalized strings than the previous framework, known as Stringprep ([RFC 3454](https://tools.ietf.org/html/rfc3454)).

PRECIS framework is defined by [RFC 7564](https://tools.ietf.org/html/rfc7564).
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

