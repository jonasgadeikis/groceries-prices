# MySQL knowledge sharing

## Project setup

To create project simply run command (it will pull images create containers for mysql and phpmyadmin):
```
make up
```
You might need to install make package if you don't have it.

For Ubuntu run command:
```
sudo apt install make
```

For Windows OS read this article [here](https://stackoverflow.com/questions/32127524/how-to-install-and-use-make-in-windows).

Then you can visit phpmyadmin in [http://localhost:8080](http://localhost:8080).

Use credentials from docker-compose.yml (marked by comment) to login to database (server is mysql). Database named "mysql_tutorial_db" will be created alongside 5 tables.

To remove containers run command:
```
make down
```
