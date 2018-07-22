#
# Lint
# `pod lib lint --verbose --no-clean --sources=http://git.souche.com/geliang/cheniu_pod.git,master --use-libraries --allow-warnings'
# Push
# `pod repo push cheniu_pod --verbose --sources=http://git.souche.com/geliang/cheniu_pod.git,master --use-libraries --allow-warnings`
#

Pod::Spec.new do |s|
  s.name             = "DSImageBitmaps"
  s.version          = "0.0.1"
  s.summary          = "Image convert to Bitmaps"
  s.description      = <<-DESC
                       UIImage convert to Bitmaps
                       DESC

  s.homepage         = "http://git.souche.com/soucheclub/SCCPay"
  s.license          = 'MIT'
  s.author           = { "陈轩石" => "chenxuanshi@souche.com" }
  s.source           = { :git => "http://git.souche.com/soucheclub/SCCPay.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'DSImageBitmaps/*.{h,m}'
  s.public_header_files = 'DSImageBitmaps/*.h'
  
end
