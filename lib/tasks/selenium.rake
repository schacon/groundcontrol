require 'selenium_importer/selenium_importer'

namespace :selly do
  desc "" # TODO:GVT: give this task a desc once it gels a bit more
  task :import do
    filename = ENV['FILE']
    if filename.nil? || !File.exists?(filename)
      $stderr.puts "Please indicate a file to import; the file must exist and be readable."
      return
    end
    SeleniumImporter.new(filename)
  end
end
