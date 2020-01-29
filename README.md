# README

## step:1 ~>
---


## Installation needed for running application
---


a) Install MySQL and setup using these commands, make sure the password you select is easy to remember
```
        sudo apt install mysql-server 
        sudo mysql_secure_installation
```
                    or               
```
        sudo apt-get install mysql-server
```

for my case, I found the second one easy as while installation I get an interface in terminal asking for a password and could diminish some step  for secure_installation which I feel a very annoying step
Note: After this setup, you should be able to run MySQL using this command, if not then try some of these issue links 
```
                            mysql -u root -p
```

(In case you get the wrong password, do `sudo su`, then `mysql` create a new user with password and use that)
          If you face error 1698      if you face error 1045

b) Installing RubyOnRails using rvm (ruby version manager)
   First, install curl and gnupg
```
        sudo apt install curl
        sudo apt install gnupg2
``` 

   Now, run these commands to install rvm
```
        curl -sSL https://rvm.io/mpapis.asc | gpg2 --import -  
        \curl -sSL https://get.rvm.io | bash -s stable
```

Important: For RVM to work properly, you have to check the 'Run command as login shell' checkbox on the Title and Command tab of the terminal's Edit ▸ Profile Preferences menu dialog, in case the menu is missing right-click the terminal app and navigate Profiles ▸ Profile 

Now, we will be using rails 5.2.2 with ruby 2.6.1
```
        rvm install 2.6.1
        rvm use 2.6.1 --default
        gem install bundler
        gem install rails -v 5.2.2
```

Install mysql gem and the libmysql-dev library
```
        sudo apt install libmysqld-dev
        gem install mysql2
```

Note: For some of the js gems
```
       sudo apt install nodejs
```
now clone my app and head to the folder in terminal and run
```
      rails server
```

which will run the server and now go to 
`
     localhost:3000
`
### DONE THE INSTALLATIONS

## step:2~> 


initially I created basic structure(products table, user table, authentication) using scaffold generator and thought of adding a controller and required actions(methods) for different works but finally, I end up  build everything from scratch for better understanding for rails framework and it's  structure

```
gem 'bootstrap-sass', '~> 3.4.1'

```

bootstrap-sass 3 used for styling many parts of the app 
and after adding small changes final could build beautiful UI 

## List of all implemented features,
  

* Image upload capability
* user can control the visibility of products( :public, :only_me )
* "Active storage used for image storing feature"
* only owner can edit, delete and update their products
* admin column to the user table and set false as default
* show page for separate user and user can see their products
* buy option for different user's products for own product view details option shown
* sold column added to product table and default value set false
* "all products are shown with created time and updated time also with user details(seller details)"
* description is for clarifying the product details
* "Admin users can add money to any User’s wallet including him/her self"

## List of non-implemented/planned features,
    

* Categories can be added to the product and 
* user can search for products based on their category 
* more image can be added for the same product
* could not align products/index cards to the center 
* user can have their profile picture and some more details 
* live chat functionality can be added so buyer and seller can discuss about the product any time

References
so many references used so can't list out but some of them are
`https://guides.rubyonrails.org/`  
`https://github.com/twbs/bootstrap-sass`  
`https://www.youtube.com/watch?v=fVtGy3QL9xg&t=82s`  

to get excess to admin functionality first signup if you are new user or login if existing one  then head to the main directory of the project and go to rails console by simply typing 
`rails console`

and find your user id
```
    u = User.all
    u = User.find(id)
    u.admin = true
    u.save
```

all done you are now an admin too
