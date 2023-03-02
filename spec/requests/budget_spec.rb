require 'rails_helper'

RSpec.describe 'Budget Splash Screen', type: :request do
  describe 'Index action' do
    before(:each) do
      get budget_index_path
    end

    it 'has the correct response status' do
      expect(response).to have_http_status(200)
    end
    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders the view with the correct placeholder text' do
      expect(response.body).to include('Budget App')
      expect(response.body).to include('LOG IN')
      expect(response.body).to include('SIGN UP')
    end
  end
end
