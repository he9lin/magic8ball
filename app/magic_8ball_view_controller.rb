class Magic8BallViewController < UIViewController
  attr_reader :label
  stylesheet :main

  def loadView
    self.view = UIImageView.alloc.init
  end

  layout :root do
    @label = subview(UILabel, :label)
    self.view.userInteractionEnabled = true
    tap = UITapGestureRecognizer.alloc.initWithTarget(self, action:'showAnswer')
    self.view.addGestureRecognizer(tap)
    @eightBall = Magic8Ball.new
  end

  def showAnswer
    UIView.animateWithDuration(1.0,
                               animations:lambda {
                                   @label.alpha = 0
                                   @label.transform = CGAffineTransformMakeScale(0.1, 0.1)
                               },
                               completion:lambda { |finished|
                                   @label.text = @eightBall.randomAnswer
                                   UIView.animateWithDuration(1.0,
                                                    animations:lambda {
                                                        @label.alpha = 1
                                                        @label.transform = CGAffineTransformIdentity
                                                    })
                               })
  end
end
