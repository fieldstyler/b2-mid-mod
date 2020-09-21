class Airline < ApplicationRecord
  validates_presence_of :name

  has_many :flights

  def passenger_list
    require "pry"; binding.pry
    flights.distinct.pluck(:passengers)
  end
end
