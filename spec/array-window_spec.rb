require 'array/window'

describe 'Array window' do

  describe 'basic scenarios' do

    it "should perform the right calculation for an odd window size" do
      (0..199).to_a.window(5, 100).should == (98..102).to_a
    end

  end

  describe 'even size resolution' do

    it "should perform the right calculation for an even window size when prioritizing greater elements" do
      (0..653).to_a.window(10, 320, :prioritize_greater).should == (316..325).to_a
    end

    it "should perform the right calculation for an even window size when prioritizing lower elements" do
      (0..653).to_a.window(10, 320, :prioritize_lower).should == (315..324).to_a
    end

  end

  describe 'edge window size scenarios' do

    it "should return an empty array when the size is zero" do
      (0..1023).to_a.window(0, 680).should == []
    end

    it "should return a single element array when the size is one" do
      (0..1023).to_a.window(1, 680).should == [680]
    end

    it "should perform the right calculation when the window size is two" do
      (0..15).to_a.window(2, 10).should == [10, 11]
    end

    it "should return the whole array when the window size is greater than the array size" do
      (0..3).to_a.window(8, 0).should == (0..3).to_a
    end

  end

  describe 'edge windows scenarios' do

    it "should return the latest elements when the center is too close to the end of the array" do
      (0..19).to_a.window(9, 17).should == (11..19).to_a
    end

    it "should return the first elements when the center is too close to the beginning of the array" do
      (0..19).to_a.window(9, 2).should == (0..8).to_a
    end

  end

end
