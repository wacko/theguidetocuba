Structuring the Application
===========================

# TODO: Improve next sentence.

Cuba doesn't impose any architecture for your application.
gives you a lot of freedom to choose the architecture of your application because it doesn't
impose any. In this guide, we will use a template called [app](https://github.com/frodsan/app). This
template includes a set of basic tools to create a web application. To start using the template, open
up a command line prompt and use git to clone the repository of the project as shown in [Example 1-1](#example11).

{id="example11", title="Example 1-1: Generating the application structure", lang="bash", line-numbers="off"}
~~~~~~~~~~~
$ git clone git@github.com:frodsan/app.git twitter_clone
$ cd twitter_clone
$ ls
README.md    config.ru    helpers    makefile    public    test
app.rb       filters      mails      models      routes    views
~~~~~~~~~~~

Now, the `twitter_clone` directory has the files and folders that make up the structure of the
application. [Figure 1-1](#figure11) shows a basic overview of the purpose of each of the files
and folders that was created by the template.

{id="figure11", title="Figure 1-1: Architecture of a Cuba application", width="wide"}
| File/Folder | Purpose                                                                                 |
|-------------|-----------------------------------------------------------------------------------------|
| .gems       | Lists the dependencies of the application. The dep gem uses this file to install all    |
|             | the missing dependencies. For more information about the dep workflow, read the next    |
|             | section ["Installing Dependencies"](#installingdependencies).                           |
|-------------|-----------------------------------------------------------------------------------------|
| app.rb      | This is the main file that loads all the dependencies, sets the proper configurations   |
|             | and defines the main routes.                                                            |
|-------------|-----------------------------------------------------------------------------------------|
| env.sh      | This file contains a list of sensitive configurations (e.g. the database's url). The    |
|             | application loads these configurations as environment variables. You can acces them in  |
|             | the code through the `ENV` accessor (e.g. `ENV["REDIS_URL"]`).                          |
|-------------|-----------------------------------------------------------------------------------------|
| config.ru   | Rack configuration file for Rack based servers used to start the application.           |
|-------------|-----------------------------------------------------------------------------------------|
| filters/    | Contains the form validators. Unlike other frameworks, Cuba delegates validation and    |
|             | whitelisting responsibilities to filter objects.                                        |
|             |                                                                                         |
|             | ["Adding validations"](#TODO) covers filter objects in more detail.                     |
|-------------|-----------------------------------------------------------------------------------------|
| helpers/    | Helpers are a simple way to extend Cuba's functionality. This folder contains all the   |
|             | helpers for the application.                                                            |
|             |                                                                                         |
|             | This topic is covered in ["Authoring your own plugin"](#TODO).                          |
|-------------|-----------------------------------------------------------------------------------------|
| mails/      | Contains mail templates used by the application.                                        |
|-------------|-----------------------------------------------------------------------------------------|
| makefile    | This file contains a series of tasks that can be run from the command line. E.g. tasks  |
|             | for running the server, testing or interacting with the application.                    |
|-------------|-----------------------------------------------------------------------------------------|
| models/     | Contains the models for the application.                                                |
|-------------|-----------------------------------------------------------------------------------------|
| public/     | Contains static files accessible to the public (e.g. web browsers). Such as error pages,|
|             | images, JavaScript and CSS files, etc.                                                  |
|             |                                                                                         |
|             | This is covered in more detail in ["Adding style to the application"](#TODO).           |
|-------------|-----------------------------------------------------------------------------------------|
| routes/     | A Cuba application is composed by other miniature applications that add functionality to|
|             | the main one. Ability to mount applications is one of the most powerful features of     |
|             | Cuba. This folder contains these miniature applications.                                |
|             |                                                                                         |
|             | ["Setting up a modular application"](#TODO) covers this topic in more depth.            |
|-------------|-----------------------------------------------------------------------------------------|
| test/       | Application tests. These are covered in ["Testing the Cuba Application"](#TODO).        |
|-------------|-----------------------------------------------------------------------------------------|
| views/      | Contains the HTML templates for the application.                                        |
