require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "is valid with all attributes" do
      @category = Category.new(name: "Furniture")
      @product = Product.new(name: "Product", price: 1000, 
                             category: @category,
                             quantity: 10)
      expect(@product).to be_valid
    end 

    it "is not valid with no name" do
      @category = Category.new(name: "Furniture")
      @product = Product.new(name: nil, price: 1000, 
                             category: @category,
                             quantity: 10)
      expect(@product).to_not be_valid
    end 

    it "is not valid with no price" do
      @category = Category.new(name: "Furniture")
      @product = Product.new(name: "Product", price: 1000, 
                             category: nil,
                             quantity: 10)
      expect(@product).to_not be_valid
    end 

    it "is not valid with no category" do
      @category = Category.new(name: "Furniture")
      @product = Product.new(name: "Product", price: nil, 
                             category: @category,
                             quantity: 10)
      expect(@product).to_not be_valid
    end 

    it "is not valid with no quantity" do
      @category = Category.new(name: "Furniture")
      @product = Product.new(name: "Product", price: 1000, 
                             category: @category,
                             quantity: nil)
      expect(@product).to_not be_valid
    end 
  end
end
