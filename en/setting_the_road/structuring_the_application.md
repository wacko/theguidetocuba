Structuring the Application
===========================

With Cuba you have a lot of freedom to choose the architecture
of your application. In this book, we will use a template called
[app](https://github.com/frodsan/app). To start using it, open up
a command line prompt and type:

```
$ git clone git@github.com:frodsan/app.git twitter
```

This will create a *twitter* directory with the files and folders for
a minimal functional application.

After the download is completed, switch to the *twitter* directory.

```
$ cd twitter
```

From now on, you must execute all the command line instructions from this
directory. For example:

```
$ ls
README.md    config.ru    helpers    makefile    public    test
app.rb       filters      mails      models      routes    views
```

This table shows a basic overview of the files and folders that make up
the structure of the application. We'll learn more about these throughout
the rest of this book.

| File/Folder | Purpose
|-------------|--------
| .gems       | A list of the dependencies for the application.
| .env        | Contains a list of sensitive configurations (e.g. the databases url).
| app.rb      | This is the main file that loads all the dependencies, sets the proper configurations and defines the main routes.
| config.ru   | Rack configuration file.
| filters/    | Contains the form validators. Unlike other frameworks, Cuba delegates validation and whitelisting responsibilities to filter objects.
| helpers/    | Helpers are a simple way to extend Cuba's functionality. This folder contains all the helpers for the application.
| mails/      | Contains mail templates used by the application.
| makefile    | This file contains a series of tasks that can be run from the command line.
| models/     | Contains the models for the application.
| public/     | Contains static files accessible to the public (e.g. web browsers). Such as error pages, images, JavaScript and CSS files, etc.
| routes/     | This folder contains  miniature applications that add functionality to the main one.
| test/       | Application tests.
| views/      | Contains the HTML templates for the application.
