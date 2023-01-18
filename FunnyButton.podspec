#
# Be sure to run `pod lib lint FunnyButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FunnyButton'
  s.version          = '0.1.3'
  s.summary          = 'Convenient debugging button'

  s.description      = <<-DESC
  Convenient debugging button.
                       DESC

  s.homepage         = 'https://github.com/Rogue24/FunnyButton'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Rogue24' => 'zhoujianping24@hotmail.com' }
  s.source           = { :git => 'https://github.com/Rogue24/FunnyButton.git', :tag => s.version.to_s }
  s.ios.deployment_target = '11.0'
  s.source_files = 'FunnyButton/Classes/**/*'
  s.swift_version = '5.0'
end
