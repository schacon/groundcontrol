class SeleniumImporter
  def initialize
    @errors = [] # an array of error messages
  end
  
  # arg should be a file path to the file to be imported
  def import(f)
    unless f
      @errors << "Please indicate a file to import"
      return false
    end
    unless File.exists?(f) && File.readable?(f)
      @errors << "The file to import must exist at the given path and must be readable"
      return false
    end
    
    
    
    
    
    true
  end
end
