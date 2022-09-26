require 'rails_helper'

RSpec.describe "Products", type: :system do
  describe "created with" do
    before do
      visit new_product_path
      @product = build(:product)
    end

    scenario "valid inputs" do
      fill_in 'Title',        with: @product.title
      fill_in 'Price',        with: @product.price
      fill_in 'Description',  with: @product.description
      fill_in 'Brand',        with: @product.brand
      click_on 'Save Product'
      expect(page).to have_content("Product was successfully created.")
    end
  end

  describe "not created with" do
    before do
      visit new_product_path
      @product = build(:product)
    end

    scenario "invalid inputs:" do
      fill_in 'Title',        with: ""
      fill_in 'Price',        with: -1
      fill_in 'Description',  with: "#" * 501
      fill_in 'Brand',        with: ""
      click_on 'Save Product'
      expec { page }.to raise_exception(ActiveRecord::RecordInvalid)
    end
  end

  describe "updated with" do
    before :each do
      @product = create(:product)
      visit edit_product_path(@product)
      @product_new = build(:product)
    end

    scenario "valid inputs" do
      expect(page).to have_field("Title", with: @product.title)
      fill_in 'Title',        with: @product_new.title
      fill_in 'Price',        with: @product_new.price
      fill_in 'Description',  with: @product_new.description
      fill_in 'Brand',        with: @product_new.brand
      click_on 'Update Product'
      expect(page).to have_content("Product was successfully updated.")
    end
  end

  describe "not updated with" do
    before :each do
      @product = create(:product)
      visit edit_product_path(@product)
      @product_new = build(:product)
    end

    scenario "invalid inputs:" do
      fill_in 'Title',        with: ""
      fill_in 'Price',        with: -1
      fill_in 'Description',  with: "asdf"
      fill_in 'Brand',        with: ""
      click_on 'Update Product'
      expect { page }.to raise_exception(ActiveRecord::RecordInvalid)
    end
  end
end
