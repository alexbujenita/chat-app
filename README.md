# ShutApp

A real-time chat application built with Ruby on Rails.

## Why?
I really enjoy writing in Ruby and especially using the Ruby on Rails framework, so I wanted to create an app that feels complete and usable.

## How to run
Runs on Ruby 4.0.7 and Rails 8.1.4. Assets are handled by propshaft with importmap-rails, and dartsass-rails compiles Bootstrap 5.3 plus the app's own SCSS. Storage is SQLite, and Action Cable runs on Solid Cable in production and the async adapter in development.

Once cloned.
```bash
bundle install
bin/rails db:setup
bin/rails dartsass:build
bin/rails server -b 0.0.0.0
```
`bin/rails dartsass:build` compiles the stylesheets (Bootstrap 5 and the app's SCSS) into `app/assets/builds/`. You can run `bin/dev` instead of the last two commands to start the server with a Sass watcher.

`-b 0.0.0.0` can be ignored.

It's there so the app can be reached from the same network, by knowing your local IP. Eg. If your local IP is 192.168.1.9, on another device connected to the same network, connect to 192.168.1.9:3000.

Please have a look into db/seeds.rb to see the admin's user initial credentials!


## What is this about?
A chatting application, in which users can join and chat on an open group, or through their profile create a group and invite other users. The group can also be edited at any point by the owner (the creator)

I tried building an app with many features such as:
* Use of hashed passwords
* Admin user (can delete other users)
* Use of validations on models
* Action Cable for real-time messaging

![](demo.gif)

The GIF below demonstrates how is possible to create a group and also how to edit it.


![](editgroup.gif)

## Known limitations
* `MessagesChannel` streams from one global `messages` stream. Every message is broadcast to every connected browser and group privacy is enforced only client-side (the channel JS discards messages meant for other groups), so anyone with devtools open can see all groups' traffic.
* `ApplicationCable::Connection` performs no identification, so WebSocket connections are anonymous.
* `db/seeds.rb` (and some app code) hardcodes ids such as `owner_id: 1`, `user_id: 1` and group 1, so the seeds are only valid against a fresh, empty database.

