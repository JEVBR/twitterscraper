# README

This repository is my solution for the challenge of Fretadao.

The challenge is (as requested) written in Ruby using:

* Ruby version 2.6.3 (latest version)

* Rails 5.2.3 ( just because Rails 6.0 ) was not out yet when i started this project

* PostgreSQL as the Database, reason: good expirience when using it before, great intergration with Heroku

* httparty to get data from external sites and nokogiri to parse this data into usable strings.

 styling for this app:

bootstrap-sass ( iknow, i should update to BS4 )

font-awesome-sass ( has the nice Twitter icon )

# Deploy

The original challenge is: https://github.com/Fretadao/challenge/tree/master/fullstack/indexer

The solution is deployed at: https://ftwitterscraper.herokuapp.com

To deploy locally, please clone the repository to your computer and then use the following commands:

$ bundle install

$ rails db:create

$ rails db:migrate

$ rails s

The solution now should be up and running on: http://localhost:3000

# Testing

(work in progress)

using the gems:

  capybara, webdrivers and launchy

System testing is done by :

$ rails test:system


