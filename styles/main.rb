Teacup::Stylesheet.new(:main) do

  style :root,
    image: "background.png".uiimage

  style :label,
    backgroundColor: "#ccc".uicolor,
    text: "Tap For Answer!",
    frame: [[10,60], [300,80]],
    textColor: "#555".uicolor,
    textAlignment: :center.uialignment,
    font: :bold.uifont(34)

end

