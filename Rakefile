require 'rake'
require 'fileutils'

task :default => :install

desc "Install all dotfiles into '~/'"
task :install_dots do
  puts "==\nInstalling dotfile into $HOME directory:"
  Dir['*'].each do |file|
    puts "  * #{file}"
    install_dot(file)
  end
  puts "All done. See Ya!\n=="
end

def install_dot(file)
  puts "    Not dotfile. Skipping" && return if non_dot?(file)
  target = File.join(ENV['HOME'], ".#{file}")
  if File.exist?(target)
    if File.identical?(file, target)
      puts "   Target and source files identical. Skipping.." && return
    else
      puts "   Target file alreay exist. Backing up.."
      FileUtils.cp(target, "#{target}.bak")
    end
  end
  puts "   Copying.."
  FileUtils.cp(file, target)
end

def non_dot?(file)
  %[Rakefile README.md mocp].include?(file)
end
