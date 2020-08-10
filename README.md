# Kinedu Api test

## Requirements

This projects was built on: 

  + Docker Desktop 2.3.0.3

It uses a docker-compose file to build two containers one for a MySql database and one for the rails environment. If you wish to do the setup in your local machine these are the versions used for all the other programs

  + Ruby on Rails 5.2
  + Ruby 2.5.5
  + mariadb 10.2

## Setup

With docker: 

 1. Open a new terminal, clone this project and open the directory

  
    ``` bash
        git clone git@github.com:HeHuHdez/kinedu-api-test.git
        cd api_test/
    ```
2. Dump the sql data from the file `demo_2019-04-04(1).sql` found in the root directory into the mariadb database.
3. Inside the directory run the following commands


    ``` bash
        # with docker
        docker-compose up -d
        docker exec -it api_test_web_1 bash
       
        # Inside the container
        
        rails db:create db:migrate db:seed
        
        # This will check that the database is created and create the test databass
        # this will also create the users table in the database and will also create the default user
        
        rails db:test:prepare
        
        # Once the database schema is done we need to copy it to
        # the test database
    ```

4. To run the tests

    ``` bash
        bundle exec rspec -f d
        # This will print out the test message.
         
        # If you want to update the swagger files 
        # you should add the following flags
        # --format Rswag::Specs::SwaggerFormatter --order defined
    ```

5. Once done, to see the test coverage open the file `./coverage/index.html`
6. You can visit the site by entering in your browser `localhost:3000` and you should be automatically redirected to the swagger documentation page. 

In a local environment: 

* Instead of running the container you should run `bundle install` and update the file `./config/database.yml` to use your database credentials, host and port. 

## Swagger

Once you have the site up and running you can visit the swagger page `/api/api-docs` and test the different api endpoints. The default user is `test@kinedu.test` and the default password is `testing1234`

If you've never used swagger before it's really easy, just click on a URL to expand it. You can read some examples on how the app responds depending on the params. Or you can try it on your own.

## App structure

The app uses a simple Bearer Authentication method for all the requests, excluding the login url, in which we obtain our authentication token, the index view for the web app and the swagger documentation. 

Since swagger can only store one example for response code I recommend executing all tests in documentation mode for the requests to see all the available tests

``` bash
    bundle exec rspec spec/requests/ -f d
```