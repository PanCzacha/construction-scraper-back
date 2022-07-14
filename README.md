# construction-scraper-back
Backend of Construction Buddy, app that will help you to track current building material prices, from three home improvement store chains in Poland.

To run the app you have to provide valid Open Route Service (https://openrouteservice.org/) API key into config.ts file. 
It's free of charge and you can login using GitHub credentials.

Included is a sql script to init a db. 
"Shops" table is populated with stores data needed to run the app.

Also you can initialize "shops" table from scratch if you need to, by using init-shops.ts file located in services/shops-db-init.

This is my private project that I want to use during construction of my house.

