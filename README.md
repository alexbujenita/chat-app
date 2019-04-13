# ShutApp

A real-time chat application built with Ruby on Rails.

## Why?
I really enjoy writing in Ruby and especially using the Ruby on Rails framework, so I wanted to create an app that feels complete and usable.

## How to run
Once cloned.
```bash
bundle install
rails db:setup
rails s -b 0.0.0.0
```
-b 0.0.0.0 can be ignored.

-b so it can be accessed on the same network, by knowing your local IP. Eg. If your local IP is 192.168.1.9, on another device connected to the same network, connect to 192.168.1.9:3000.

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



