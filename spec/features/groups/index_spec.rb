require 'rails_helper'

RSpec.describe 'Group Index', type: :feature do
  before :each do
    @user = User.create(name: 'John', surname: 'Doe', email: 'john@mail.com',
                        password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user

    @addcat = "a[href='/groups/new']"
    @group = Group.create(name: 'Entertainment', user: @user)
    visit groups_path
  end

  it 'shows the right content' do
    expect(page).to have_content('CATEGORIES')
  end

  it 'When I click on Add Category, I am redirected to the Category Creation form' do
    find(@addcat.to_s).click
    expect(page).to have_content('ADD A NEW CATEGORY')
  end

  it 'When clicking on a category, I am redirected to the detaile of that category Page,
  and I can add a new transaction' do
    click_link 'Entertainment'
    expect(page).to have_content('ADD A NEW TRANSACTION')
  end
end
