require 'rails_helper'

RSpec.describe 'Airline Show Page' do
  before :each do
    @airline = Airline.create(name: "First Airline")
    @flight_1 = @airline.flights.create(number: 1234)
    @flight_2 = @airline.flights.create(number: 2345)
    @flight_3 = @airline.flights.create(number: 3456)
    @passenger_1 = @flight_1.passengers.create(name: "Tyler", age: 10)
    @passenger_2 = @flight_1.passengers.create(name: "David", age: 20)
    @passenger_3 = @flight_1.passengers.create(name: "Alex", age: 30)
    @passenger_4 = @flight_2.passengers.create(name: "Dan", age: 40)
    @passenger_5 = @flight_2.passengers.create(name: "Saryn", age: 50)
    @passenger_6 = @flight_3.passengers.create(name: "Tim", age: 60)
    @passenger_7 = @flight_3.passengers.create(name: "Brian", age: 70)
    @passenger_8 = @flight_3.passengers.create(name: "Dani", age: 80)
    @flights = Flight.all
    visit airline_path(@airline)
  end

  describe 'user story 2' do
    it 'can see a unique list of passengers that have flights from that airline' do
      @airline.passenger_list.each do |passenger|
        expect(page).to have_content(passenger.name)
      end
    end


  end
end
