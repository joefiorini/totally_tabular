require File.join(File.dirname(__FILE__), '..', '..', 'spec_helper')

describe "instance_exec" do

  it "should have instance_exec method on object" do
    Object.new.should respond_to(:instance_exec)
  end

  it "should provide arguments in a block" do
    the_object = Object.new
    final_object = nil
    b = Proc.new { |o| final_object = o }
    Object.new.instance_exec(the_object, &b)
    final_object.should == the_object
  end
end
