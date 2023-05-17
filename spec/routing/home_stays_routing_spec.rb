require 'rails_helper'

RSpec.describe HomeStaysController, type: :routing do
  describe 'routing' do
    let (:userOne) do
      User.new(name: 'Test user')
    end
    let (:home_stay) do
      HomeStay.new(name: 'Paradise', location: 'Kashmir', description: 'Like Paradise', no_of_rooms: 2, rating: 3,
        price: 245, user: userOne)
    end
    it 'routes to #index' do
      expect(get: '/home_stays').to route_to('home_stays#index')
    end

    it 'routes to #show' do
      expect(get: '/home_stays/1').to route_to('home_stays#show', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/home_stays').to route_to('home_stays#create')
    end

    it 'routes to #destroy' do
      expect(delete: '/home_stays/1').to route_to('home_stays#destroy', id: '1')
    end
  end
end
