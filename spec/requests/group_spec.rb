require 'rails_helper'

RSpec.describe Group, type: :request do
  user = User.create(name: 'John', surname: 'Doe', email: 'john@test.com', password: '123456')

  describe 'Index action' do
    before(:each) do
      sign_in user
      subject { Group.create(user:, name: 'test', icon: 'test.png') }
      get groups_path
    end

    it 'has the correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:index)
    end

    it 'renders the view with the correct placeholder text' do
      expect(response.body).to include('CATEGORIES')
    end

    # it 'renders the view with the new category added' do
    #   expect(response.body).to include('test')
    # end
  end

  describe 'New action' do
    before(:each) do
      sign_in user
      subject { Group.create(user:, name: 'test', icon: 'test.png') }
      get new_group_path
    end

    it 'has the correct response status' do
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      expect(response).to render_template(:new)
    end

    it 'renders the view with the correct placeholder text' do
      expect(response.body).to include('CATEGORIES PAGE')
    end
  end
end
