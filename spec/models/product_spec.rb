require 'rails_helper'

RSpec.describe Product, type: :model do
  it "creates a new record with valid attributes" do
    expect(Product.count).to eq(0)
    create(:product)
    expect(Product.count).to eq(1)
  end

  describe "title" do
    it "must be present" do
      product = build(:product, title: nil)
      expect { product.save! }.to raise_exception(ActiveRecord::RecordInvalid)
    end

    it "must be between 1 and 100 characters" do
      product = build(:product, title: "")
      expect { product.save! }.to raise_exception(ActiveRecord::RecordInvalid)
      product = build(:product, title: "#" * 101)
      expect { product.save! }.to raise_exception(ActiveRecord::RecordInvalid)
    end
  end

  describe "price" do
    it "must be present" do
      product = build(:product, price: nil)
      expect { product.save! }.to raise_exception(ActiveRecord::RecordInvalid)
    end

    it "must be a number" do
      product = build(:product, price: -1)
      expect { product.save! }.to raise_exception(ActiveRecord::RecordInvalid)
    end
  end

  describe "description do" do
    it "must be less than 500 words" do
      product = build(:product, description: "# " * 501)
      expect { product.save! }.to raise_exception(ActiveRecord::RecordInvalid)
    end
  end

  describe "brand" do
    it "must be present" do
      product = build(:product, brand: "")
      expect { product.save! }.to raise_exception(ActiveRecord::RecordInvalid)
    end
  end
end
