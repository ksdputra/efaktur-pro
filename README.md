# README

## Step for creating new Rails project with React frontend
Reference: https://www.freecodecamp.org/news/how-to-create-a-rails-project-with-a-react-and-redux-front-end-8b01e17a1db/
1. `rails new PROJECT_NAME --webpack=react`
1. `bundle install`
1. Caution, this command might not be necessary. If already installed, then it will ask you to override some files. `rails webpacker:install`
1. `rails webpacker:install:react rails generate react:install yarn install`

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
