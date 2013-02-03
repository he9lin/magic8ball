Teacup::Stylesheet.new(:main) do

  style :root,
    image: UIImage.imageNamed('background.png')

  style :label,
    backgroundColor: UIColor.lightGrayColor,
    text: "Tap For Answer!",
    frame: [[10,60], [300,80]],
    textColor: UIColor.darkGrayColor,
    textAlignment: UITextAlignmentCenter,
    font: UIFont.boldSystemFontOfSize(34)

end

