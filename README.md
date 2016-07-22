# Your Hair Salon :scissors: + :haircut: = :moneybag:
### By _Alexander Jacks_
_an Epicodus Project, July 2016_

## Description
Website built to help a small hair salon manage database of clients and stylists.

## Setup
Download this repository.
```
git clone https://github.com/Adjectival/hair_salon
```

In Terminal, run Ruby's bundler:
```
bundle
```

Then open your SQL SERVER and:
```
CREATE DATABASE hair_salon;
CREATE TABLE stylists (id serial PRIMARY KEY, name varchar, contact varchar);
CREATE TABLE clients (id serial PRIMARY KEY, name varchar, contact varchar, stylist_id int);
```

#### Specifications
Salon management can:
- view, add, update, delete stylists
- view, add, update, delete clients
- assign clients to a stylist


### Support and contact
_Contact alexd (dot) jacks (at) gmail (dot) com with questions regarding this software. Check out some of these resources to understand the technologies._

1. learnhowtoprogram.com
2. ruby-lang.org
3. w3schools.com
4. getbootstrap.com

## Technologies Used
- Postgres
- Ruby 2.2
- Sinatra/WEBrick
- Bootstrap 3

### Legal
_This software is available under the MIT license and can be modified and used for any purposes without express permission of the author._

Copyright (c) 2016 **_Alexander Jacks_**
