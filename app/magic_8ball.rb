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
    data = BW::File.load('answers', 'json')

    answers = begin
      BW::JSON.parse(data)['answers']
    rescue BW::JSON::ParserError
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
