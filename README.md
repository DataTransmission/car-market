# Car Market
**About**
<br>
This is a simple demo app on a backend API for an car market app.  Users can buy and sell their car the app using this API.
<br><br>
**Note**
<br>
For the sake of simplicity, I have deployed this API to heroku with SQLite to quickly test its functionalities.  You are free to setup your own server environment and use your preferred database system.
<br><br>
**Use**
<br>
I am also making an mobile app to consume this API to show how it interacts with other programs.  You can visit [here](http://github.com/ctrl-alt-del/car-market-android) to check out my Android app.
<br><br>
## Setup
This application is built with Ruby 2.1.1 and Rails 4.1.4.  In case of any compatibility issue, please refer to the official documents.
<br><br>
**Setup Local Environment**
<br>
1. You need to have Git. If you haven't have it, you can follow my instruction in [here](http://github.com/ctrl-alt-del/devenv#git) to get Git for your operating system.
<br>
2. Setup WAMP, MAMP, or LAMP on your machine base on you operating system.
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
5. run `rake db:create db:migrate db:seed` to setup the SQLite database for development and test.
<br>
6. turn on your WAMP, MAMP, or LAMP.
<br>
7. run `rails server` to launch the server on `http://localhost:3000`
