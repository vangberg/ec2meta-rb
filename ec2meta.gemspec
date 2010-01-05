Gem::Specification.new do |s|
  s.name     = "ec2meta"
  s.version  = "0.1"
  s.date     = "2010-01-05"
  s.summary  = "ec2 instance metadata wrapper for ruby"
  s.email    = "harry@vangberg.name"
  s.homepage = "http://github.com/ichverstehe/ec2meta-rb"
  s.description  = "ec2 instance metadata wrapper for ruby"
  s.has_rdoc = false
  s.authors  = ["Harry Vangberg"]
  s.files    = [
    "README", 
		"ec2meta.gemspec", 
		"lib/ec2meta.rb"
  ]
  s.test_files  = [
    "test/test_ec2meta.rb"
  ]
end
