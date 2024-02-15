# README

AyeMatey is a demo app for a treasure hunt game

## Setup

1. Install ruby 3.3.0
2. Install bundler `gem install bundler`
3. Install gems `bundle install`
4. Install && run postgresql
5. Install && run redis-server
6. Create database infra
```
rails db:create
rails db:migrate
rails db:seed
```
7. Run sidekiq and rails using foreman
```
foreman start -f Procfile.dev
```
