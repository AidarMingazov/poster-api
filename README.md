# Poster

[![Build Status](https://semaphoreci.com/api/v1/aydarmingazov/poster-api/branches/master/badge.svg)](https://semaphoreci.com/aydarmingazov/poster-api)
[![Test Coverage](https://api.codeclimate.com/v1/badges/77c2c26513747d268f38/test_coverage)](https://codeclimate.com/github/AidarMingazov/poster-api/test_coverage)
[![Maintainability](https://api.codeclimate.com/v1/badges/77c2c26513747d268f38/maintainability)](https://codeclimate.com/github/AidarMingazov/poster-api/maintainability)

## Project task tracker

https://www.pivotaltracker.com/n/projects/2318427

## Dependencies

* PostgreSQL 11.2
* Ruby 2.4.2
* PhantomJS
* Rails 5

Setup required dependencies from `Brewfile`:
```bash
brew tap Homebrew/bundle
brew bundle
```

## Quick Start

```bash
# clone repo
git clone git@github.com:AidarMingazov/poster-api.git
cd repo

# run setup script
bin/setup

# configure ENV variables in .env
vim .env

# run server on 5000 port
bin/server
```

## Scripts

* `bin/setup` - setup required gems and migrate db if needed
* `bin/quality` - run brakeman and rails_best_practices for the app
* `bin/ci` - should be used in the CI to run specs

## Production

* https://poster-base.herokuapp.com
