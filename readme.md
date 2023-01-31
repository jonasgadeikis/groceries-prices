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
Project is using docker image so you will need to install docker and docker compose.

For Ubuntu follow these instructions:
* [Docker](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)
* [Docker compose](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04)

For Windows OS read this article [here](https://stackoverflow.com/questions/32127524/how-to-install-and-use-make-in-windows).

Then you can visit phpmyadmin in [http://localhost:8080](http://localhost:8080).

Use credentials from docker-compose.yml (marked by comment) to login to database (server is mysql). Database named "groceries_prices" will be created alongside 5 tables.

To remove containers run command:
```
make down
```
