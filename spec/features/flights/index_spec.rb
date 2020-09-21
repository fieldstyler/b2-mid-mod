require 'rails_helper'

RSpec.describe 'Flight Index Page' do
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
    visit flights_path
  end

  describe 'user story 1' do
    it 'can display a list of all flight numbers, and under each flight number are the names of all of that flights passengers' do
      @flights.each do |flight|
        expect(page).to have_content(flight.number)
        flight.passengers.each do |passenger|
          expect(page).to have_content(passenger.name)
        end
      end
    end
  end

  describe 'user story 3' do
    it 'can see a link to remove passenger from flight next to each passengers name' do
      within "#passenger-#{@passenger_1.id}" do
        expect(page).to have_link("Remove Passenger From Flight")
        expect(page).to have_content(@passenger_1.name)
      end
    end

    it 'can click link, return to flights index page, and no longer see that passenger' do
      within "#passenger-#{@passenger_1.id}" do
        click_link "Remove Passenger From Flight"
      end
      expect(current_path).to eq(flights_path)
      expect(page).to_not have_content(@passenger_1.name)
    end
  end
end
