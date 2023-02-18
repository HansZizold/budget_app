require 'rails_helper'

RSpec.describe 'Operation New4', type: :feature do
  before :each do
    @user = User.create(name: 'John', surname: 'Doe', email: 'john@mail.com',
                        password: '123456', password_confirmation: '123456')
    sign_in @user

    @group = Group.create(name: 'Entertainment', user: @user)
    @operation = Operation.create(name: 'Movies', amount: 47, user: @user)
    @groupop = Groupoperation.create(group: @group, operation: @operation)
    visit new_operation_path(@group)
  end

  it 'shows the right content' do
    expect(page).to have_content('ADD A NEW TRANSACTION')
  end

  it 'When I click on CANCEL, I am redirected to the category details page' do
    click_link 'CANCEL'
    expect(page).to have_content('Entertainment')
  end

  it 'When I click on SAVE TRANSACTION, I can see the new transaction on the category details page' do
    click_on 'SAVE TRANSACTION'
    expect(page).to have_content('Movies')
  end
end
