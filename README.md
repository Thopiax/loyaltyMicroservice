# LOYALTY Microservice - Technical test

## Skeleton
This is a project to provide Swagger support inside the [Sinatra](http://www.sinatrarb.com/) framework.  
This sample was generated with the [swagger-codegen](https://github.com/swagger-api/swagger-codegen) project.

## Choices

### Swagger-generated Sinatra server

The swagger code generation offered a functional yet simple basis on which to start. It allowed me to concentrate on building the API logic with great software engineering practices.


### Status Enum

Status class allows for a more flexible and extendable status hierarchy. Since the ride thresholds for each status weren't given in the instructions, I devised my own and added them as constants in `loyalty_app.rb`:

```
BRONZE_THRESHOLD = 0
SILVER_THRESHOLD = 10
GOLD_THRESHOLD = 25
PLATINUM_THRESHOLD = 50
```

### Extension

As a quick extension to the project, I decided to add the capability of receiving any currency through the `points` endpoint and converting it to the correct amount of points (with relation to euros). This would facilitate the expansion of the micro-service's use to an international level. It might end up being useful *cough* [Uber ban in London](http://www.bbc.co.uk/news/business-41363923) *cough*.

## HOW TO

### Launch the server
Make sure you have ruby 2.3 or above and the `blunder` gem installed (run `bundle -v`, if that doesn't work run `gem install bundler` to install)

```bash
> bundle install
> bundle exec rackup config.ru
```

The server will be up and running at `tcp://localost:9292`.

Voila!

### Run tests
Just run `ruby run_tests.rb` :)


## Instructions
You must implement a loyalty micro-service, using express and a mongo database.
Make your job in mind to create a pull request.

### Step 1 : user loyalty points

* user earn loyalty points for each spent euros (1 euro = 1 point)
* user can check its loyalty points total

### Step 2 : loyalty status

* user gets a loyalty status (bronze, silver, gold, platinum), based on its total number of rides
* add to the route for spending money the fact of doing a ride or not
* user can check its current status
* optional: user can check its ride count and know how many rides remain to do to next status

### Step 3 : earning points based on current status

* number of points earned by euro depends on current user status
	* bronze: 1 euro = 1 point
	* silver: 1 euro = 3 point
	* gold: 1 euro = 5 points
	* platinum: 1 euro = 10 points
