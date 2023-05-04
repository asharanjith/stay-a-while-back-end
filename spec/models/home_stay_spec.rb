require 'rails_helper'

RSpec.describe HomeStay, type: :model do
  let(:userOne) do
    User.new(name: 'Test user')
  end

  let(:home_stay) do
    HomeStay.new(name: 'Paradise', location: 'Kashmir', description: 'Like Paradise', no_of_rooms: 2, rating: 3,
                 price: 245, user: userOne)
  end

  it 'is valid with valid attributes' do
    expect(home_stay).to be_valid
  end

  it 'is not valid without a name' do
    home_stay.name = nil
    expect(home_stay).to_not be_valid
  end

  it 'is not valid without a location' do
    home_stay.location = nil
    expect(home_stay).to_not be_valid
  end

  it 'is not valid without a description' do
    home_stay.description = nil
    expect(home_stay).to_not be_valid
  end

  it 'is not valid without a no_of_rooms' do
    home_stay.no_of_rooms = nil
    expect(home_stay).to_not be_valid
  end

  it 'is not valid without a rating' do
    home_stay.rating = nil
    expect(home_stay).to_not be_valid
  end

  it 'is not valid without a price' do
    home_stay.price = nil
    expect(home_stay).to_not be_valid
  end

  it 'is not valid without a user' do
    home_stay.user = nil
    expect(home_stay).to_not be_valid
  end
end
