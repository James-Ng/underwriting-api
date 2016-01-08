[![Stories in Ready](https://badge.waffle.io/jamesnguyenvnn/underwriting-api.png?label=ready&title=Ready)](https://waffle.io/jamesnguyenvnn/underwriting-api)
# underwriting-api
This is a test from Mortgage Club. For this test, I have enhancement about property_type.  

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version : 2.2.2
* Rails version : 4.2.2

## Configuration and installation

Install gem

    bundle install


## Database creation

I use sqlite3 on local and PostgreSQL on Heroku

    rake db:migration

* Database initialization

I created some example data base on the test. 

    rake db:seed

## How to run the test suite 

In source code, I used simplecov to check coverage ( 100% coverage without application#index ) and guard to help me run test when changing code.
Use guard

    guard
    
Or use rspec to run test 
    
    bundle exec rspec

And press 'enter', simplecov will grenerate coverage folder. You can open index.html to see the coverage. 

## Deployment instructions ( using heroku )

## License
Copyright © 2015 jamesnguyenvnn. It is free software, and may be redistributed under the terms specified in the MIT-LICENSE file.

##About jamesnguyenvnn

Please see https://vn.linkedin.com/in/jamesnguyenvnn