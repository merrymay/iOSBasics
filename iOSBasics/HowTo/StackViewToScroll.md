#  How to scroll a stackview 

- https://stackoverflow.com/questions/31668970/is-it-possible-for-uistackview-to-scroll 




In case anyone is looking for a solution without code, I created an example to do this completely in the storyboard, using Auto Layout.

You can get it from github.

Basically, to recreate the example:

Create a UIScrollView, and set its constraints.
Add a UIStackView to the UIScrollView
Set the constraints: Leading, Trailing, Top & Bottom should be equal to the ones from UIScrollView
Set up an equal Width constraint between the UIStackView and UIScrollView.
Set Axis = Vertical, Alignment = Fill, Distribution = Equal Spacing, and Spacing = 0 on the UIStackView
Add a number of UIViews to the UIStackView
Run
