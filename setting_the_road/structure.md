Structuring the Application
===========================

Cuba gives you a lot of freedom to choose the architecture of your
application. In this guide, we will use a template called [app](https://github.com/frodsan/app).

To start using the template, open up a command line prompt and type:

```html
$ git clone git@github.com:frodsan/app.git twitter
```

This will create a `twitter` directory with the files and folders to get
a minimal functional application.

After you download the template, switch to the application's directory.

```html
$ cd twitter
```

From now on, you must execute all the command line instructions from this
directory. For example:

```html
$ ls
README.md    config.ru    helpers    makefile    public    test
app.rb       filters      mails      models      routes    views
```

This table shows a basic overview of the files and folders that make up the structure of the application. 
We'll learn more about these files and directories throughout the rest of this book.

| File/Folder | Purpose
|-------------|--------
| .gems       | Lists the dependencies of the application. The dep gem uses this file to install all the missing dependencies. For more information about the dep workflow, read the next section ["Installing Dependencies"](#comingsoon).
| app.rb      | This is the main file that loads all the dependencies, sets the proper configurations and defines the main routes.
| env.sh      | This file contains a list of sensitive configurations (e.g. the database's url). The application loads these configurations as environment variables. Later, you can acces them in the code through the `ENV` accessor.
| config.ru   | Rack configuration file for Rack based servers used to start the application.
| filters/    | Contains the form validators. Unlike other frameworks, Cuba delegates validation and whitelisting responsibilities to filter objects.
| helpers/    | Helpers are a simple way to extend Cuba's functionality. This folder contains all the helpers for the application.
| mails/      | Contains mail templates used by the application.
| makefile    | This file contains a series of tasks that can be run from the command line. E.g. tasks for running the server, testing or interacting with the application.
| models/     | Contains the models for the application.
| public/     | Contains static files accessible to the public (e.g. web browsers). Such as error pages, images, JavaScript and CSS files, etc.
| routes/     | A Cuba application is composed by other miniature applications that add functionality to the main one. Ability to mount applications is one of the most powerful features of Cuba. This folder contains these miniature applications.
| test/       | Application tests.
| views/      | Contains the HTML templates for the application.
