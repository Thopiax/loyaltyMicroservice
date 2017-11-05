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
      "name" => "user_id",
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

  begin
    return 400 unless params["amount"].present? && params["amount"].to_f > 0

    user = User.find(params["userId"])
    user.euros_spent += params["amount"].to_f
    user.save!

    { "result" => "ok" }.to_json
  rescue Mongoid::Errors::DocumentNotFound
    404
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

  begin
    user = User.find(params["userId"])
    { "points" => user.points }.to_json
  rescue Mongoid::Errors::DocumentNotFound
    404
  end
end
