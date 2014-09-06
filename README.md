# Car Market
**About**
<br>
I always wish to have a better and easier way to buy and sell used cars, and since I also need an project to get my Ruby on Rails skills proficient, I decided to start this project, **Car Market**.

The project include a restful API (current repository), an [Android](https://github.com/ctrl-alt-del/car-market-android) app and a iOS app (coming soon).

This repository contains the restful API for Car Market.  The Android and iOS will communicate and consume this restful API through JSON.
<br><br>
**Note**
<br>
1. For the sake of simplicity, I have deployed this API to Heroku with SQLite to quickly test its functionalities.  You can check it out on [here](http://car-market.herokuapp.com/api/v1/listings) with the [instruction](#quickstart).  You are also free to setup your own server environment and use your preferred database system.

2. New routes and API calls will be added as more features are developed on the mobile apps.

## Setup
**Version**
<br>
This application is built with **Ruby 2.1.1** and **Rails 4.1.4**.  In case of any compatibility issue, please refer to the official documents.
<br><br>
**Setup Local Environment**
<br>
1. You need to have Git. If you haven't have it, you can follow my instruction in [here](http://github.com/ctrl-alt-del/devenv#git) to get Git running on your operating system.
<br>
2. Setup WAMP, MAMP, or LAMP on your machine base on you operating system.  You may also use VagrantBox, VirtualBox, or VMWare to setup your dev environment.
<br>
3. Clone this project into a folder in your machine `e.g. ~/Sites`and navigate to its main directory.
<br>
```sh
mkdir -p ~/Sites
cd ~/Sites
git clone https://github.com/ctrl-alt-del/car-market
cd car-market
```
<br>
4. run `bundle update` and then `bundle install` to install all the required dependencies.
<br>
5. turn on your WAMP, MAMP, or LAMP.
<br>
6. run `rake db:create db:migrate db:seed` to setup the SQLite database for development and test.
<br>
7. run `rails server` to launch the server on `http://localhost:3000`


## Quickstart
The routes of this REST API follow the convention.

### Sign up
`POST /api/v1/users`

| Parameter                   | required | default  |
| :-------------------------- | :------: | :------: |
| user[nickname]              | true     | N/A      |
| user[first_name]            | false    | ""       |
| user[last_name]             | false    | ""       |
| user[email]                 | true     | N/A      |
| user[password]              | true     | N/A      |
| user[password_confirmation] | true     | N/A      |
| user[status]                | true     | "active" |


### Sign in
`POST /api/v1/users/signin`

| Parameter                   | required | default  |
| :-------------------------- | :------: | :------: |
| user[email]                 | true     | N/A      |
| user[password]              | true     | N/A      |

You will get an `access_token` of your account once you have signed in.  The token will be needed for the rest of the API calls.
