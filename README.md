# How you setup and run this project -

> step 1: clone repo
  
>  step 3: edit .env.example to .env
   
> step 4: run composer install

```bash
  composer install
 npm install
npm run dev
  ``` 
  
  > step 5: generate a new key
  
```bash
  php artisan key:generate
  ``` 
  
  >  step 6: create a new database 
  
  >  step 7: setup .env 
  
    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1  
    DB_PORT=3306  
    DB_DATABASE=barta 
    DB_USERNAME=root 
    DB_PASSWORD=
    
  >  step 8: run migration 

```bash
  php artisan migrate --seed
  ``` 
  
  >  step 9: run project
  
```bash
  php artisan serve
  ```
You need to create an API key in a project in [ably](https://ably.com/). Set it to `ABLY_KEY` in `.env` file.
For more information on using the Ably maintained drivers [Ably Broadcaster for Laravel](https://github.com/ably/laravel-broadcaster)
