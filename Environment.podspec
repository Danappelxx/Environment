Pod::Spec.new do |s|

  s.name         = "Environment"
  s.version      = "0.1.0"
  s.summary      = "Easy access to environment variables from Swift. Linux & OS X ready."

  s.description  = <<-DESC
                  Access environment variables with ease, even in places where `NSProcessInfo` is unavailable. Linux & OS X ready.
                   DESC

  s.homepage     = "https://github.com/czechboy0/Environment"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Honza Dvorsky" => "https://honzadvorsky.com" }
  s.social_media_url   = "http://twitter.com/czechboy0"

  s.osx.deployment_target = "10.9"
  s.ios.deployment_target = "8.0"
  s.watchos.deployment_target = "2.0"
  s.tvos.deployment_target = "9.0"

  s.source       = { :git => "https://github.com/czechboy0/Environment.git", :tag => "#{s.version}" }
  s.source_files  = "Sources/Environment/*.swift"
  
end
