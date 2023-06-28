require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:each) do
    @user = User.create(name: 'Josue', email: 'Josue@gmail.com', password: '123456', password_confirmation: '123456')
    @group = Group.create(name: 'Car', icon: 'www.innova.com', author_id: @user.id)
    @budget = Budget.create(name: 'PC', amount: 12, author_id: @user.id)
  end

  it 'should create a valid budget' do
    expect(@budget).to be_valid
  end

  it 'should not be a valid budget without name' do
    @budget.name = nil
    expect(@budget).to_not be_valid
  end

  it 'should not be a vald budget without amount' do
    @budget.amount = nil
    expect(@budget).to_not be_valid
  end
end
