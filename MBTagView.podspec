Pod::Spec.new do |s|
  s.name         = "MBTagView"
  s.version      = "1.0"
  s.license      = "MIT"
  s.summary      = "MBTagView is a view supports to display tags with auto layout."
  s.homepage     = "http://github.com/mailburn/MBTagView"

  s.description  = <<-DESC
                    MBTagView is a view supports to display tags with auto layout.
                    - supports auto layout
                    - supports working with UITableViewCell
                    - supports single and multi-line mode
                   DESC

  s.author       = { "Kirill Kunst" => "kirillkunst@gmail.com" }
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/mailburn/MBTagView.git", :tag => "1.0" }
  s.source_files  = "MBTagView/*"
  s.framework  = "UIKit", "Foundation"
  s.requires_arc = true
  s.dependency "Masonry"

end
