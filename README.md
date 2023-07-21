# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#=========================================
These are the steps you must follow.
1. rvm use 3.0.1

2. bundle install

# creation and migration
3. rails db:create
4. rails db:migrate

# Run Job 
5. rails jobs:work 

# Run manually job from the console (optional)
 5.1. ScrapingJob.perform_later (If you want to test)

# Run rspec 
6. according to your directory
ex:- bundle exec rspec /home/yuva/Downloads/Rails7_React/test_project/spec/controllers/api/v1/products_controller_spec.rb 

# Note:- npm install (if needed)
#==========================================