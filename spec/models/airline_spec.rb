require 'rails_helper'

RSpec.describe Airline do
  it { should validate_presence_of :name }
  it { should have_many :flights }
end
