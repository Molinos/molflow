require 'erb'
require 'pathname'

task :install do
  home_dir = Pathname.new(ENV['HOME'])
  molflow = File.expand_path("../../templates/molflow.erb", __FILE__)

  entries = [{ template: molflow, file: home_dir.join('.molflow') }]

  entries.each do |entry|
    if File.exists?(entry[:file])
      warn "[skip] #{entry[:file]} already exists"
    else
      File.open(entry[:file], 'w+') do |f|
        f.write(ERB.new(File.read(entry[:template])).result(binding))
      end
    end
  end
end

def site
  STDOUT.puts "atlassian site:"
  input = STDIN.gets.chomp
  raise "enter address" if input == ''

  input
end

def username
  STDOUT.puts "atlassian username:"
  input = STDIN.gets.chomp
  raise "enter username" if input == ''

  input
end

def password
  STDOUT.puts "atlassian password:"
  input = STDIN.gets.chomp
  raise "enter password" if input == ''

  input
end