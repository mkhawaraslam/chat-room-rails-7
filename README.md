#### Project Dependencies

To setup the project, follow the below commands in the project directory.

```
$ bundle install
```

```
$ yarn install
```

This will install all the required gems for the project on your system.


#### Create and Migrate db

For setting up the migrations on your system, run the following commands on your system:

```
rails db:create
rails db:migrate
```

If a project has a seed file in it, one needs to run the following command as well:

```
rails db:seed
```

### Starting the rails applications

```
$ bin/dev
```

Visit on localhost:3000

### If you're facing any issue regarding javascript and turbo, run the following command and then start the server
```
$ yarn build
```

### For the testing users:
*1-*
```
email: khawar.aslam@example.com
password: password
```

*2-*
```
email: john.doe@example.com
password: password
```
