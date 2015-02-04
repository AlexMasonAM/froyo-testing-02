require 'rails_helper'

RSpec.describe Yogurt, :type => :model do

  it "responds to flavor"

  it "requires flavor"

  it "validates flavor charater count is less than 30 charaters"

  it "requires topping"

  it "validates topping charater count is less than 30 charaters"

  it "requires quantity"

  it "validates quantity is greater than 0"

  it "validates quantity is less than 12"

  describe "#bite" do

    it "responds to bite"

    it "should remove 1 from the quantity"

    it "should raise error if quantity is zero (is empty)"

  end

  describe "#refill" do

    it "responds to refill"

    it "should fill quantity up to 12"

    it "should raise error if quantity is 12 (is full)"

  end

  describe "#set_topping" do

    it "responds to add_topping with one variable"

    it "raise error if variable is not a string"

    it "raise error if toppings is an empty string"

    it "updates the toppings to the inputed variable"

  end

end
