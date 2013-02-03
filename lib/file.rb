module BubbleWrap
  module File
    LoadError = Class.new(StandardError)

    def self.load(file_name, file_ext='json')
      file  = NSBundle.mainBundle.pathForResource(file_name, ofType:file_ext)
      error = Pointer.new(:object)
      opts  = NSDataReadingUncached
      data  = NSData.alloc.initWithContentsOfFile(file, options:opts, error:error)
      raise LoadError, error[0].description if error[0]
      if block_given?
        yield data
      else
        data
      end
    end
  end
end

