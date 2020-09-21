require 'rails_helper'

RSpec.describe Flight, type: :model do
  it { should validate_presence_of :number }
  it { should belong_to :airline }
  it { should have_many :passenger_flights }
  it { should have_many(:passengers).through(:passenger_flights) }
end
