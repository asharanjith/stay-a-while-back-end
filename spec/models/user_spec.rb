require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    before(:example) do
      User.create(name: 'test1')
      @user = User.new(name: 'test')
    end
    context 'when wrong name' do
      it 'is not valid' do
        @user.name = nil
        expect(@user).to_not be_valid
      end
      it 'is not valid' do
        @user.name = ''
        expect(@user).to_not be_valid
      end
      it 'is not valid' do
        @user.name = 'te'
        expect(@user).to_not be_valid
      end
      it 'is not valid' do
        @user.name = 'test1'
        expect(@user).to_not be_valid
      end
    end
    context 'when correct name' do
      it 'is valid' do
        @user.name = 'test'
        expect(@user).to be_valid
      end
    end
  end
end
