# Drover Code Challenge

This is my solution to drover code challange

## Installation


Install docker 

then run 

    $ docker-compose up

And then execute:

    $ docker-compose run web bin/setup
this will create the database and load the seed file

## Api docs

to see the documentation of the endpoints go to

    $ /api-docs/index.html

## Tests

to run the tests use rspec

    $ rspec

## Things to improve

- Some data can be cached it will not change frequently
- Add something to handle the exceptions in a central way
- Add more tests
- Add more data to swagger
- Use fakker to create seed data 
