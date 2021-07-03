# Movie List Service
Hello and welcome! 🎬 🎥 🍿 

### Introduction

The goal of this app is to provide access to retrieve or manipulate data. This API service returns a list of movies for a user, with metadata collected from upstream services. 

### Quick Start

To run locally:
1. Clone this repo: 
```bash
$ git clone git@github.com:mhamdani/movie-list-service.git
```
1. Setup the app and run the `movie_services.jar` file: 
```bash
$ bundle install
$ java -jar movie_services.jar
```
1. Start up the server to run the project: 
```bash
rails s -p 8080
```

## Action! 🎬

Visit `http://localhost:8080/users/901345879/movies` to see a JSON list of movies for user `901345879`.

Search for a list of movies by user id in the [search page](http://localhost:8080).

### Design and Performance Notes

* Discussion of major design decisions
 
  The architecture of this service is a self-contained, data access API with a basic backend composition that works over HTTP and returns data from upstream services in JSON. 
  
  Given that Ruby enforces a Global VM Lock that prevents multiple threads from running within a single process, the [original implementation](https://github.com/mhamdani/movie-list-service/blob/f1b1ecbd776b4719e4773d441f37033714bde2b7/app/services/movie_service.rb) made synchronous calls for each movie title and movie image. This performed poorly with a response time of 103729 ms.
  
  An improvement in performance was made by leveraging the [`Typhoeus`](https://github.com/typhoeus/typhoeus) gem and using its [Hydra API](https://github.com/typhoeus/typhoeus/blob/master/lib/typhoeus/hydra.rb) to dispatch parallelized requests using cURL multithreading capabilities. The Typhoeus adapter enabled batch requests [in parallel](https://github.com/mhamdani/movie-list-service/blob/bf3deacbff005d042dc836e2d007f2496c497dba/app/services/movie_service.rb), allowing the service to fire off an array of requests for movie titles and movie images in two chunks. This improved the performance with a response time of 1681 ms.  
 
* Discussion of your solution’s performance

  * Original response time: 103729 ms
  * Improved response time: 1681 ms

  The improved solution has a response time that's 98% faster than the original; taking 1.6% of the time to respond in comparison. 

* How long did your solution take you? What scope did you cut? What would you have done if you had more time?

  The solution took 2-3 hours to implement. Metrics and logging were cut. Given more time, I would add an APM to monitor network performance. 

* How did you handle the latency and error rates from each of the services?

  At the time of this writing, I have not implemented latency and error handling.  

* What would you do to make this service production ready?

  - Add APM to monitor latency, error rates, and throughput. 
  - Add logging and metrics.
  - Add latency and error handling. 
  - Validate request data.
  - Add rate limits.  
  - Implement CORS to blacklist suspicious domains.
  - Add authentication and authorization.
  - Add field filters for search.
  - Support sorting for frontend flexibility.
  - Add comments and documentation where helpful. 

