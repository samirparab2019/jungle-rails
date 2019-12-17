require 'rails_helper'

RSpec.feature "Visitor click one of the product partials and go to new page", type: :feature, js: true do

    # SETUP
    before :each do
      @category = Category.create! name: 'Apparel'

      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end

    scenario "They see an individual product" do
      visit root_path
      within('article.product', match: :first) do
        all('a').first.click do
          expect(page).to have_content("Description")
        end
      end

      
      # DEBUG
      save_screenshot
    end
  

end 



