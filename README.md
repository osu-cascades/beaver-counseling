# BeaverCounseling Application

BeaverCounseling Application will enable OSU Cascades Counseling Clinic clients to fill out and sign clinic forms digitally. This data will be stored electronically, allowing clinic staff to search and access client information.

## Table of Contents

- [Install](#install)
- [Getting Started](#Getting-Started)
- [Deployment](#Deployment-Started)

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

###### Install PostgreSQL
You will also need to download PostgreSQL. We used the Graphical Installer which can be found at: https://www.postgresql.org/download/

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

Then start the server
```
$ rails server
```

Then open a web browser with the web address localhost:3000 to see the app running.

## Deployment

We have chosen to deploy to Heroku located here: https://beavercounseling.herokuapp.com/


Copyright © 2017 OSU Cascades. All rights reserved.
