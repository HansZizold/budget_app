require 'rails_helper'

RSpec.describe Operation, type: :model do
  let(:user) { User.create(name: 'John', surname: 'Doe', email: 'john@test.com', password: '123456') }

  it 'name must not be blankcharacters' do
    subject { Operation.create(user:, name: 'opertest', amount: 10) }
    subject.name = ''
    expect(subject).to_not be_valid
    subject.name = 'a' * 55
    expect(subject).to_not be_valid
  end

  it 'amount must not greater than 0' do
    subject.name = 0
    expect(subject).to_not be_valid
  end

  it 'should be an instance of the class Group' do
    expect(subject).to be_instance_of Operation
  end
end
