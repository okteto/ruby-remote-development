# Remote Development with RubyMine and Okteto


##  Deploy your development environment

[![Develop on Okteto](https://okteto.com/develop-okteto.svg)](https://cloud.okteto.com/deploy)

You can also do it from your local terminal with the command below. 

```
okteto stack deploy --build
```

Once the application has been deployed, Okteto will show you the endpoints [in the dashboard](https://cloud.okteto.com).

## Develop on your development environment

Open RubyMine and load the project.  After that, open a terminal, and run `okteto up` there to activate your development environment. From now on, any command that you run on this terminal (e.g. `bundle exec rake db:migrate`) will run in your remote development environment, instead of on your local machine.

The project is already configured to use Okteto. To start the service, all you need to do is right click on `app.rb` and select `Run: app`. 

As long as `okteto up` is running,  all your code changes will be automatically synchronized between your local and remote environments. On top of that, the service is already configured to hot reload your changes, so all you need to do is write code.

## Remote debugging

The project is also configured to debug remotely. In order to do this, you'll first need to start a debugging session on the remote development environment. To do this, run the command below on your remote terminal:

```
rdebug-ide --host 0.0.0.0 --port 1234 --dispatcher-port 26162 app.rb
```

Now we are ready to start debugging in the IDE.  Set the breakpoints in your application, and then start debugging on your local machine. To do this, press `^` twice and type the configuration name (Remote debug: okteto) in the popup. Press and hold down the `⇧` key (the dialog title changes to Debug) and press `⏎`.

## Access the database from your local machine 

Okteto will automatically forward your database port to your local machine, so it'll be available on `localhost:3306`. 

You can directly RubyMine's [database tools](https://www.jetbrains.com/help/ruby/database-tool-window.html) in case you need to query it, or any other SQL client you have installed in your local machine. 

