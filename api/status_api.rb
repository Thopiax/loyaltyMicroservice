require 'json'

LoyaltyApp.add_route('GET', '/api/user/{userId}/status', {
  "resourcePath" => "/Status",
  "summary" => "Get user loyalty status.",
  "nickname" => "add_status",
  "responseClass" => "string",
  "endpoint" => "/user/{userId}/status",
  "notes" => "",
  "parameters" => [
    {
      "name" => "user_id",
      "description" => "User&#39;s unique ID",
      "dataType" => "string",
      "paramType" => "path",
    }
    ]}) do
  cross_origin

  User.find_or_404(params["userId"]) do |user|
    { status: user.status }.to_json
  end
end
