class HomescreenController < UIViewController
  attr_accessor :regular_button_was_tapped, :motionkit_button_was_tapped
  def loadView
    @regular_button_was_tapped = false
    @motionkit_button_was_tapped = false

    @layout = HomescreenLayout.new
    self.view = @layout.view # adds motion kit button
    add_button_with_add_subview # adds button plain old way

    @motionkit_button = @layout.get(:motionkit_button)
    @regular_button.addTarget(self, action:"tapped_regular_button", forControlEvents:UIControlEventTouchUpInside)
    @motionkit_button.addTarget(self, action:"tapped_motionkit_button", forControlEvents:UIControlEventTouchUpInside)
  end

  def add_button_with_add_subview
    @regular_button = UIButton.buttonWithType(UIButtonTypeCustom).tap do |b|
      b.setTitle("Hello World", forStates:UIControlStateNormal)
      b.backgroundColor = UIColor.greenColor
      b.frame = [[0,20],[320,45]]
    end
    self.view.addSubview(@regular_button)
  end

  def tapped_regular_button
    puts " (tapped regular button!)"
    @regular_button_was_tapped = true
  end

  def tapped_motionkit_button
    puts " (tapped motionkit button!)"
    @motionkit_button_was_tapped = true
  end
end

class HomescreenLayout < MK::Layout
  def layout
    root :homescreen_view do
      add UIButton, :motionkit_button
    end
  end

  def homescreen_view_style
    background_color UIColor.whiteColor
  end

  def motionkit_button_style
    title "Hello Motionkit"
    background_color UIColor.redColor
    constraints do
      width.equals(:superview)
      height.equals(45)
      center_x.equals(:superview)
      bottom.equals(:superview)
    end
  end
end
