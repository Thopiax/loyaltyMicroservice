require 'json'


LoyaltyApp.add_route('POST', '/api/user/{userId}/points', {
  "resourcePath" => "/Points",
  "summary" => "Add euros spent to user profile.",
  "nickname" => "add_points",
  "responseClass" => "void",
  "endpoint" => "/user/{userId}/points",
  "notes" => "",
  "parameters" => [
    {
      "name" => "userId",
      "description" => "User&#39;s unique ID",
      "dataType" => "string",
      "paramType" => "path",
    },
    {
      "name" => "body",
      "description" => "Points payload.",
      "dataType" => "UserPoints",
      "paramType" => "body",
    }
    ]}) do
  cross_origin

  return 400 unless User.valid_user_points(params["eurosSpent"])
  User.find_or_404(params["userId"]) do |user|
    user.add_points(params["eurosSpent"].to_f)
    200
  end
end


LoyaltyApp.add_route('GET', '/api/user/{userId}/points', {
  "resourcePath" => "/Points",
  "summary" => "Get user loyalty points.",
  "nickname" => "get_points",
  "responseClass" => "int",
  "endpoint" => "/user/{userId}/points",
  "notes" => "",
  "parameters" => [
    {
      "name" => "user_id",
      "description" => "User&#39;s unique ID",
      "dataType" => "string",
      "paramType" => "path",
    },
    ]}) do
  cross_origin

  User.find_or_404(params["userId"]) do |user|
    { "points" => user.points }.to_json
  end
end
