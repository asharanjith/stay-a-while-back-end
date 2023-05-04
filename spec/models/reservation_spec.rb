require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:userOne) do
    User.create(name: 'Test user')
  end

  let(:home_stay) do
    HomeStay.create(name: 'Paradise', location: 'Kashmir', description: 'Like Paradise', no_of_rooms: 2, rating: 3,
                    price: 245, user: userOne)
  end

  let(:reservation) do
    Reservation.create(no_of_persons: 4, start_date: '2023-04-16', user_id: userOne.id, home_stay_id: home_stay.id,
                       end_date: '2023-06-14')
  end

  it 'is valid with valid attributes' do
    expect(reservation).to be_valid
  end

  it 'is not valid if an attribute is missing' do
    reservation.user_id = nil
    expect(reservation).to_not be_valid
  end

  it 'Should increase the number of reservations when a new one is created' do
    old_size = Reservation.count

    Reservation.create(no_of_persons: 3, start_date: '2023-04-16', user_id: userOne.id, home_stay_id: home_stay.id,
                       end_date: '2023-06-14')
    new_size = Reservation.count

    expect(new_size).to be > old_size
  end

  it 'Should save the right information to the database' do
    info_check1 = Reservation.find(reservation.id).no_of_persons
    info_check2 = Reservation.find(reservation.id).start_date.to_date
    info_check3 = Reservation.find(reservation.id).end_date.to_date

    info_check4 = Reservation.find(reservation.id).user_id
    info_check5 = Reservation.find(reservation.id).home_stay_id

    expect(info_check1).to eq(4)
    expect(info_check2).to eq(Date.parse('2023-04-16'))
    expect(info_check3).to eq(Date.parse('2023-06-14'))

    expect(info_check4).to eq(userOne.id)
    expect(info_check5).to eq(home_stay.id)
  end
end
