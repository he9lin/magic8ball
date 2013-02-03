class Magic8Ball
  attr_reader :answers
  
  def initialize
    @answers = loadAnswers
  end
  
  def randomAnswer
    @answers.sample
  end
  
private
  
  def loadAnswers    
    answerFile = NSBundle.mainBundle.pathForResource('answers', ofType:'json')      

    errorPointer = Pointer.new(:object)

    data = NSData.alloc.initWithContentsOfFile(answerFile, 
                                               options:NSDataReadingUncached, 
                                               error:errorPointer)
    unless data
      printError errorPointer[0]
      return defaultAnswers
    end
    
    json = NSJSONSerialization.JSONObjectWithData(data, 
                                                  options:NSDataReadingUncached, 
                                                  error:errorPointer)
    unless json
      printError errorPointer[0]
      return defaultAnswers
    end

    json['answers']
  end
  
  def defaultAnswers
    ['Yes', 'No', 'Maybe', 'Try Again']
  end
  
  def printError(error)
    $stderr.puts "Error: #{error.description}" 
  end
    
end