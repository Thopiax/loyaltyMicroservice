require 'json'


MyApp.add_route('POST', '/api/user/{userId}/points', {
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
      "dataType" => "int",
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
  # the guts live here

  {"message" => "yes, it worked"}.to_json
end


MyApp.add_route('GET', '/api/user/{userId}/points', {
  "resourcePath" => "/Points",
  "summary" => "Get user loyalty points.",
  "nickname" => "get_points", 
  "responseClass" => "UserPoints", 
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
  # the guts live here

  {"message" => "yes, it worked"}.to_json
end

