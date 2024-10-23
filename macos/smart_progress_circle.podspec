#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint smart_progress_circle.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'smart_progress_circle'
  s.version          = '0.0.1'
  s.summary          = 'SmartProgressCircle is a customizable Flutter widget for displaying dynamic circular progress. Ideal for real-time updates in apps like fitness trackers and dashboards.'
  s.description      = <<-DESC
SmartProgressCircle is a customizable Flutter widget for displaying dynamic circular progress. Ideal for real-time updates in apps like fitness trackers and dashboards.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }

  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
