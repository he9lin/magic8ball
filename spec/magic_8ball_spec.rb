describe "Magic8Ball" do
  before do
    @eightBall = Magic8Ball.new
  end

  it "has 13 answers" do
    @eightBall.answers.size.should.equal 13
  end
  
  it "generates a random answer" do
    answer = @eightBall.randomAnswer
    
    @eightBall.answers.should.include answer
  end
end