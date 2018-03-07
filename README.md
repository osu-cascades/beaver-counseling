# BeaverCounseling Application

BeaverCounseling Application will enable OSU Cascades Counseling Clinic clients to fill out and sign clinic forms digitally. This data will be stored electronically, allowing clinic staff to search and access client information.

## Table of Contents

- [Install](#install)
- [Getting Started](#getting-started)
- [Deployment](#deployment)

## Install

Before running this web app you will need to install rails 5.1.4 and ruby 2.4.2.
You will also need to install PostgreSQL.

###### To install Ruby you will first need Xcode Command Line Tools
```
$ xcode-select --install
```

###### Install Homebrew
Check if Homebrew is installed:
```
$ brew
-bash: brew: command not found
```

To avoid RVM installation issues, install Homebrew before RVM. If Homebrew is not installed, install it:
```
$ ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```

###### Install RVM
The RVM website explains how to install RVM. Here’s the simplest way:
```
$ \curl -L https://get.rvm.io | bash -s stable
```
For more install information checkout: https://rvm.io/rvm/install

###### Install Ruby
After installing RVM, install the newest version of Ruby.
You must specify a version number to install the newest stable Ruby version:
```
$ rvm install ruby-2.4.2
```

###### Install Rails
At the time we made the app the most recent version was rails 5.1.4
```
$ gem install rails
```

###### Install PostgreSQL
You will also need to download PostgreSQL. We used the Graphical Installer which can be found at:
https://postgresapp.com/

You can also download manually via:
https://www.postgresql.org/download/


## Getting Started

Once you have downloaded Ruby, Rails, and PostgreSQL you can now begin.

Go ahead and clone the repo
```
$ git clone https://github.com/osu-cascades/beaver-counseling
$ cd beaver-counseling
```

Next, run bundle install to download the necessary gems
```
$ bundle install
```

You will need to create to database
```
$ rake db:create
```

You will then need to migrate the database
```
$ rake db:migrate
```

Then create the initial admin run the db:seed command
```
$ rake db:seed
```

Finally start the server
```
$ rails server
```

Then open a web browser with the web address localhost:3000 to see the app running.

## Deployment

We are using Google Cloud Platforms' App Engine to host the application.
Hosted at: https://beavercounseling.appspot.com/

To deploy to GCP a more comprehensive guide can be found at:
https://cloud.google.com/ruby/rails/using-cloudsql-postgres

Simplified steps:

0. Get access to project

1. Download Google Cloud SDK

2. Run 
```
$ bundle exec bin/rails assets:precompile
```

3. Run 
```
$ gcloud app deploy --no-promote
```

4. Run any migrations with 
```
$ bundle exec rake appengine:exec -- bundle exec rake db:migrate
```

5. View website using 
```
$ glcoud app deploy 
```

Copyright © 2017 OSU Cascades. All rights reserved.