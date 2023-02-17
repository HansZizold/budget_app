require 'rails_helper'

RSpec.describe 'Budget Index', type: :feature do
  before :each do
    @addfood = "a[href='/groups/new']"

    visit budget_index_path
  end

  it 'shows the right content' do
    expect(page).to have_content('SIGN UP')
  end

  it 'When I click on LOG IN, I am redirected to the Log In page' do
    click_link 'LOG IN'
    expect(page).to have_content('Remember me')
  end

  it 'When I click on SIGN UP, I am redirected to the Sign Up page' do
    click_link 'SIGN UP'
    expect(page).to have_content('Log in')
  end
end
