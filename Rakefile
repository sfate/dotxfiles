require 'rake'
require 'fileutils'

task :default => :install_dots

desc "Install all dotfiles into '~/'"
task :install_dots do
  puts "==\nInstalling dotfile into $HOME directory:"
  Dir['dots/*'].each do |file|
    puts "  * #{file}"
    file.include?('moc') ? install_dot_with_dir(file) : install_dot(file)
  end
  puts "All done. See Ya!\n=="
end

def install_dot(file)
  target = File.join(ENV['HOME'], ".#{File.basename(file)}")
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

def install_dot_with_dir(dir)
  target = File.join(ENV['HOME'], ".#{File.basename(dir)}")
  dots   = Dir[File.join(dir, '*')]
  if File.directory?(target)
    dots.each do |file|
      target_file = File.join(target, file)
      if File.identical?(file, target_file)
        puts "   Target and source files identical. Skipping.." && return
      else
        puts "   Target file alreay exist. Backing up.."
        FileUtils.cp(target_file, "#{target_file}.bak")
      end
    end
  else
    FileUtils.mkdir_p(target)
  end
  dots.each do |file|
    target_file = File.join(target, file)
    puts "   Copying.."
    FileUtils.cp(file, target)
  end
end

