# Mini Reddit

A mini version of the website we all love and enjoy

* Signup & login to your account
* Create subs of your interest
* Create posts in the sub

## How to access the website

### Through the heroku webstie

Go to the website [Here](https://infinite-atoll-35493.herokuapp.com/)

### In your local machine

1. First, clone this repo to your local mechine with __git__ command.
* `git clone https://github.com/YatoAki/reddit-mini`
2. Go to the cloned source code dictionary.
* `cd ./reddit-mini`
3. Install the required gems
* `bundle install`
4. Migrate the database
* `rails db:migrate`
5. Run the rails server
* `rails server`
6. Go to `http://localhost:3000/` in your broswer

## Authentication

### Bcrypt

* By using the password-hashing function called **Bcrypt**, we were able to minimize dataleak by only keep hashed version of passwords

### Session Token

* We allow users to login by giving session token as cookie

## Website architecture

### Model

#### User - `user.rb`

* username, password_digest _(hashed password)_, session_token
* has many _posts_, _subs_ 

#### Sub - `sub.rb`

* name, detail
* belongs to _moderator_
* has many _posts_

#### Post - `post.rb`

* title, content
* belongs to _author_, _sub_

### Controller

#### UsersController - `users_controller.rb`

* new, create

#### SessionsController - `sessions_controller.rb`

* create, new, destroy

#### SubsController - `subs_controller.rb`

* create, new, destroy, index, show, edit, update

#### PostsController - `posts_controller.rb`

* create, destroy, show

## Comming soon ...

* Upvote & downvote
* Comments
