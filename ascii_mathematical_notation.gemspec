Gem::Specification.new do |s|

  s.name     = 'ascii_mathematical_notation'
  s.version  = '1.0.0'

  s.homepage = 'https://github.com/carlosjhr64/ascii_mathematical_notation'

  s.author   = 'carlosjhr64'
  s.email    = 'carlosjhr64@gmail.com'

  s.date     = '2015-01-16'
  s.licenses = ['MIT']

  s.description = <<DESCRIPTION
Write your math using plain ASCII text files with Vim-Ruby.
DESCRIPTION

  s.summary = <<SUMMARY
Write your math using plain ASCII text files with Vim-Ruby.
SUMMARY

  s.extra_rdoc_files = ['README.rdoc']
  s.rdoc_options     = ["--main", "README.rdoc"]

  s.require_paths = ["lib"]
  s.files = %w(
README.rdoc
data/VERSION
data/a2x.yml
data/definitions.yml
data/fractions.yml
data/greek.yml
data/m2x2.yml
data/math.yml
data/subscript.yml
data/superscript.yml
lib/ascii_mathematical_notation.rb
lib/ascii_mathematical_notation/ascii_mathematical_notation.rb
lib/ascii_mathematical_notation/current_line.rb
lib/ascii_mathematical_notation/line.rb
lib/ascii_mathematical_notation/methods.rb
lib/ascii_mathematical_notation/version.rb
  )

  s.add_runtime_dependency 'user_space', '~> 2.0', '>= 2.0.1'
  s.requirements << 'ruby: ruby 2.1.5p273 (2014-11-13 revision 48405) [x86_64-linux]'
  s.requirements << 'vim: VIM - Vi IMproved 7.4 (2013 Aug 10, compiled Jan 13 2015 16:45:26)'

end
