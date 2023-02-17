require 'rails_helper'

RSpec.describe 'New Category', type: :feature do
  before :each do
    @user = User.create(name: 'John', surname: 'Doe', email: 'john@mail.com',
                        password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user

    visit new_group_path
  end

  it 'shows the right content' do
    expect(page).to have_content('ADD A NEW CATEGORY')
  end

  it 'When I click on CATEGORIES PAGE, I am redirected to the Categories Page' do
    click_link 'CATEGORIES PAGE'
    expect(page).to have_content('ADD NEW CATEGORY')
  end

  it 'When clicking on SAVE CATEGORY, I am redirected to the Categories Page,
   and I can see the new category I created' do
    @group = Group.create(name: 'Entertainment', user: @user)
    click_on 'SAVE CATEGORY'
    expect(page).to have_content('Entertainment')
  end
end
