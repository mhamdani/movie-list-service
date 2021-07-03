# Movie List Service
Hello and welcome! 🎬 🎥 🍿

### Introduction

This is an API service that returns a list of movies for a user with metadata collected from upstream services. 

### Quick Start

To run locally:
1. Clone this repo: 
```bash
$ git clone git@github.com:mhamdani/movie-list-service.git
```
1. Setup and run the `movie_services.jar` file: 
```bash
$ bundle install
$ java -jar movie_services.jar
```
1. Start the app: 
```bash
rails s -p 8080
```

## Action! 🎬 🎬 🎬

Once running, visit `http://localhost:8080/users/901345879/movies` to see a JSON list of movies for user `901345879`.

You can also search for a list of movies by typing in a user id via the [search page](http://localhost:8080).

### Design Notes

A brief write up containing:

* Discussion of major design decisions
* Discussion of your solution’s performance
* How long did your solution take you? What scope did you cut? What would you have done if you had more time?
* How did you handle the latency and error rates from each of the services?
* What would you do to make this service production ready?



Thanks for checking out  movie-list-service! 🎉🎉🎉

