require 'rails_helper'

RSpec.describe 'Group Show', type: :feature do
  before :each do
    @user = User.create(name: 'John', surname: 'Doe', email: 'john@mail.com',
                        password: '123456', password_confirmation: '123456')
    @user.confirm
    sign_in @user

    @group = Group.create(name: 'Entertainment', user: @user)
    @operation = Operation.create(name: 'Movies', amount: 47, user: @user)
    @groupop = Groupoperation.create(group: @group, operation: @operation)
    visit group_path(@group)
  end

  it 'shows the right content' do
    expect(page).to have_content('ADD A NEW TRANSACTION')
  end

  it 'shows the test category: Entertainment' do
    expect(page).to have_content('Entertainment')
  end

  it 'shows the test transaction created: Movies' do
    expect(page).to have_content('Movies')
  end

  it 'When I click on Add a New Transaction, I am redirected to the Transaction creation form' do
    click_link 'ADD A NEW TRANSACTION'
    expect(page).to have_content('Select Category')
  end
end
