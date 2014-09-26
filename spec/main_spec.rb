describe "Macbacon" do
  tests HomescreenController

  it "can simulate tapping a button placed with cocoa's addSubview" do
    controller.regular_button_was_tapped.should == false
    view("Hello World").should.not.be.nil
    tap("Hello World")
    controller.regular_button_was_tapped.should == true
  end

  it "can simulate tapping a button placed with cocoa's addSubview" do
    controller.motionkit_button_was_tapped.should == false
    view("Hello Motionkit").should.not.be.nil
    tap("Hello Motionkit")
    controller.motionkit_button_was_tapped.should == true
  end
end
