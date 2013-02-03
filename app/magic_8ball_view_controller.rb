class Magic8BallViewController < UIViewController
  stylesheet :main

  def loadView
    self.view = UIImageView.alloc.init
  end

  layout :root do
    @label = subview(UILabel, :label)
    @eightBall = Magic8Ball.new
    view.when_tapped { show_answer }
  end

  def show_answer
    UIView.animate(
      duration: 1, 
      after: lambda { |finished|
        @label.text = @eightBall.randomAnswer
        @label.animate(1) do
          @label.alpha = 1
          @label.transform = CGAffineTransformIdentity
        end
      }
    ) do
      @label.alpha = 0
      @label.transform = CGAffineTransformMakeScale(0.1, 0.1)
    end
  end
end
