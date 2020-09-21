require 'rails_helper'

RSpec.describe Airline do
  it { should validate_presence_of :name }
  it { should have_many :flights }
  it { should have_many(:passengers).through(:flights) }

  describe 'passenger list method' do
    it 'should display a unique list of passengers for that airline' do
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
      @passenger_9 = @flight_2.passengers.create(name: "Saryn", age: 100)
      unique_passenger_list = ["Alex", "Brian", "Dan", "Dani", "David", "Saryn", "Tim", "Tyler"]
      expect(@airline.passenger_list).to eq(unique_passenger_list)
    end

  end
end
