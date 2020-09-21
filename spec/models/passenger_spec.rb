require 'rails_helper'

RSpec.describe Passenger do
  it { should validate_presence_of :name }
  it { should validate_presence_of :age }
  it { should have_many :passenger_flights }
  it { should have_many(:flights).through(:passenger_flights) }

  describe 'flight count model' do
    it 'can count the number of flights that a specific passenger is on' do
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

      expect(@passenger_1.flight_count).to eq(1)
    end
  end
end
