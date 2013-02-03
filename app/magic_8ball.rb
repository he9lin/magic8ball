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
    begin
      data = BW::File.load('answers', 'json')
      BW::JSON.parse(data)['answers']
    rescue BW::JSON::ParserError, BW::File::LoadError
      defaultAnswers
    end
  end

  def defaultAnswers
    ['Yes', 'No', 'Maybe', 'Try Again']
  end

  def printError(error)
    $stderr.puts "Error: #{error.description}"
  end

end
