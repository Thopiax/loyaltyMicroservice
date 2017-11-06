require 'json'

LoyaltyApp.add_route('POST', '/api/user', {
  "resourcePath" => "/User",
  "summary" => "Create new user.",
  "nickname" => "add_user",
  "responseClass" => "inline_response_201",
  "endpoint" => "/user",
  "notes" => "",
  "parameters" => []}) do
  cross_origin

  new_user_id = User.create.id.to_s
  {"id" => new_user_id}.to_json
end
