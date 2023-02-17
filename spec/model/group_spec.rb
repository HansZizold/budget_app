require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(name: 'John', surname: 'Doe', email: 'john@test.com', password: '123456') }

  it 'name must not be blankcharacters' do
    user.confirm
    subject { Group.create(user:, name: 'test', icon: 'test.png') }
    subject.name = ''
    expect(subject).to_not be_valid
  end

  it 'should be an instance of the class Group' do
    expect(subject).to be_instance_of Group
  end
end
