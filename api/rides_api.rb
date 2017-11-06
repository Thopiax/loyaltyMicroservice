require 'json'

LoyaltyApp.add_route('GET', '/api/user/{userId}/rides', {
  "resourcePath" => "/Rides",
  "summary" => "Get user ride status (i.e. ride count and remaining rides to upgrade status).",
  "nickname" => "get_rides",
  "responseClass" => "object",
  "endpoint" => "/user/{userId}/rides",
  "notes" => "",
  "parameters" => [
    {
      "name" => "userId",
      "description" => "User&#39;s unique ID",
      "dataType" => "string",
      "paramType" => "path",
    }
    ]}) do
  cross_origin

  User.find_or_404(params["userId"]) do |user|
    {
      rideCount: user.ride_count,
      ridesRemaining: user.rides_remaining
    }.to_json
  end
end
