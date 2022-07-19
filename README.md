# Steps used to generate this project

## New project

###### `Terminal`

`rails new blog_on_rails`

###### For windows in `Gemfile` use

```
gem 'tzinfo-data'
gem 'tzinfo'
```

then do
`bundle install` (for windows)

#### Generate `Posts` scaffold (Models, Controllers, Views etc)

In terminal `rails generate scaffold post title:string body:text`

#### Generate `Comments` resource

In terminal `rails g resource comment post:references content:text`

#### Edit `post.rb` Model to include `comments` and validation

```rb
validates(:title,
    presence: true,
    :uniqueness => { :case_sensitive => false })
validates :body, presence: true, length: { minimum: 50 }
has_many :comments
```

#### Edit `routes.rb` to make `posts` & `comments` work together & set the root

```rb
root "posts#index"
resources :posts do
  resources :comments, only: [:create, :destroy]
end
```

#### Database Migration

`rails db:migrate`

#### Add `faker` for seeding

###### `Gemfile`

`gem "faker", "~> 2.11"`

###### `terminal`

`bundle install`

Add seeder in `seeder.rb`

run `rails db:seed`
(You can also `rails db:reset` to reset)

### Add boostrap

###### `Gemfile`

```rb
gem 'bootstrap', '~> 5.1.3'
gem 'jquery-rails'
gem 'popper_js', '~> 2.9.3'
```

###### `terminal`

`bundle install`

###### `stylesheets`

- Create `main.scss` file in the same directory
- Rename `application.css` -> `application.scss` & add

```scss
@import 'bootstrap';
@import 'main';
```

###### `application.js`

```js
//= require jquery3
//= require popper
//= require bootstrap
//= require rails-ujs
//= require turbolinks
//= require_tree .
```

### Add `local-time` for displaying local time

`./bin/importmap pin local-time` in terminal

this will add pin to `importmap.rb` from cdn

In `application.js` add

```
import LocalTime from "local-time"
LocalTime.start()
```

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

- Ruby version

- System dependencies

- Configuration

- Database creation

- Database initialization

- How to run the test suite

- Services (job queues, cache servers, search engines, etc.)

- Deployment instructions

- ...

```

```
