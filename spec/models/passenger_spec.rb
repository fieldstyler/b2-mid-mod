require 'rails_helper'

RSpec.describe Passenger do
  it { should validate_presence_of :name }
  it { should validate_presence_of :age }
  it { should have_many :passenger_flights }
  it { should have_many(:flights).through(:passenger_flights) }
end
