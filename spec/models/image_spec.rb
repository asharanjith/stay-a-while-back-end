require 'rails_helper'

RSpec.describe Image, type: :model do
  let (:userOne) do
    User.new(name: 'Test user')
  end
  let (:home_stay) do
    HomeStay.new(name: 'Paradise', location: 'Kashmir', description: 'Like Paradise', no_of_rooms: 2, rating: 3,
      price: 245, user: userOne)
  end
  let (:image) do
    Image.new(url: 'image', home_stay: home_stay)
  end

  it 'is valid with valid attributes' do
    expect(image).to be_valid
  end
  it 'is not valid without a url' do
    image.url = nil
    expect(image).to_not be_valid
  end
end
