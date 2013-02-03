describe "Magic8BallViewController" do
  before do
    @vc = Magic8BallViewController.alloc.init
    @vc.view # force the view to load
  end

  it "has a background image" do
    @vc.view.image.should.not.be.nil
  end
  
  it "has a label" do
    @vc.label.text.should == "Tap For Answer!"
  end
  
  it "has a single-tap gesture recognizer" do
    @vc.view.gestureRecognizers.size.should.equal 1
    
    tap = @vc.view.gestureRecognizers.first
    tap.numberOfTapsRequired.should.equal 1
  end

  it "updates the label when the answer is shown" do
    class Magic8Ball
      def randomAnswer
        "No So Random"
      end
    end
    
    @vc.showAnswer
    
    wait 1.0 do
      @vc.label.text.should == "No So Random"
    end
  end
end