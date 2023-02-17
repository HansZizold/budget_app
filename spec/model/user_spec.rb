require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'John', surname: 'Doe', email: 'john@test.com', password: '123456')
  user.confirm
  before { user.save }

  it 'should have a name' do
    user.name = 'a' * 30
    expect(user).to_not be_valid
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'should have a surname' do
    user.surname = 'a' * 30
    expect(user).to_not be_valid
    user.surname = nil
    expect(user).to_not be_valid
  end
end
