require 'rails_helper'

RSpec.feature "Visitor adds product to cart", type: :feature, js: true do

  before :each do
    
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99,
        image: open_asset('apparel1.jpg')
      )
    end
  end

  scenario "they see 1 item in their cart in navbar" do
    # ACT
    visit root_path

    # DEBUG / VERIFY
    save_screenshot
    first(:button, 'Add').click
    page.has_content?('My Cart (1)')
    save_screenshot
  end

end
