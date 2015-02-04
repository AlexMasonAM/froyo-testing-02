require 'rails_helper'

RSpec.describe Yogurt, :type => :model do
  let(:yogurt) { Yogurt.new(flavor: 'chocolate', topping: 'oreos', quantity: 10.2) }

  it "responds to flavor" do
    expect(Yogurt.new).to respond_to(:flavor)
  end

  it "requires flavor" do
    yogurt.flavor = nil
    expect(yogurt).to be_invalid
  end

  it "validates flavor charater count is less than 30 charaters" do
    yogurt.flavor = "nil" * 11
    expect(yogurt).to be_invalid
  end

  it "requires topping" do
    yogurt.topping = nil
    expect(yogurt).to be_invalid
  end


  it "validates topping charater count is less than 30 charaters" do
    yogurt.topping = "nil" * 11
    expect(yogurt).to be_invalid
  end

  it "requires quantity"  do
    yogurt.quantity = nil
    expect(yogurt).to be_invalid
  end

  it "validates quantity is greater than 0" do
    yogurt.quantity = -1.0
    expect(yogurt).to be_invalid
  end

  it "validates quantity is less than 12" do
    yogurt.quantity = 12.1
    expect(yogurt).to be_invalid
  end

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
