require 'json'


MyApp.add_route('POST', '/api/user', {
  "resourcePath" => "/User",
  "summary" => "Create new user.",
  "nickname" => "add_user", 
  "responseClass" => "inline_response_201", 
  "endpoint" => "/user", 
  "notes" => "",
  "parameters" => [
    ]}) do
  cross_origin
  # the guts live here

  {"message" => "yes, it worked"}.to_json
end

