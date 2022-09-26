require 'rails_helper'

RSpec.describe Product, type: :model do
  it "creates a new record with valid attributes" do
    expect(Product.count).to eq(0)
    @product = create(:product)
    expect(Product.count).to eq(1)
  end

  describe "title" do
    it "must be present" do
      expect(Product.count).to eq(0)
      @product = create(:product, title: "")
      expect(Product.count).to eq(0)
    end

    it "must be between 1 and 100 characters" do
      expect(Product.count).to eq(0)
      @product = create(:product, title: "")
      @product = create(:product, title: "#" * 101)
      expect(Product.count).to eq(0)
    end
  end

  describe "price" do
    it "must be present" do
      expect(Product.count).to eq(0)
      @product = create(:product, price: nil)
      expect(Product.count).to eq(0)
    end

    it "must be a number" do
      expect(Product.count).to eq(0)
      @product = create(:product, price: -1)
      @product = create(:product, price: 5001)
      expect(Product.count).to eq(0)
    end
  end

  describe "description do" do
    it "must be less than 500 words" do
      expect(Product.count).to eq(0)
      @product = create(:product, description: "#" * 501)
      expect(Product.count).to eq(0)
    end
  end

  describe "brand" do
    it "must be present" do
      expect(Product.count).to eq(0)
      @product = create(:product, brand: "")
      expect(Product.count).to eq(0)
    end
  end
end
