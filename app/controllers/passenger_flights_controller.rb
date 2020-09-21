class PassengerFlightsController < ApplicationController
  def destroy
    pf = PassengerFlight.find_by(passenger_id: params[:passenger_id], flight_id: params[:flight_id])
    pf.destroy
    redirect_to flights_path
  end
end
