require 'rails_helper'

RSpec.describe 'Group Index', type: :feature do
  before :each do
    @user = User.create(name: 'John', surname: 'Doe', email: 'john@mail.com',
                        password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user

    @cat = Group.new(name: 'Test Group', icon: 'test.png', user: @user)

    @addfood = "a[href='/groups/new']"

    visit groups_path
  end

  it 'shows the right content' do
    expect(page).to have_content('CATEGORIES')
  end

  it 'When I click on Add Category, I am redirected to the Category Creation form' do
    find(@addfood.to_s).click
    expect(page).to have_content('ADD A NEW CATEGORY')
  end

  it 'shows the name of the category created: Test Group' do
    expect(page).to have_content('Test Group')
  end
end
