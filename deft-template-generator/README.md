# DeftJS Application Skeleton Generator

## Introduction

This is a Gradle build that generates a basic ExtJS/DeftJS application skeleton. A Gradle wrapper batch file called `gradlew.bat` and shell script `gradlew` are included, which should automatically download Gradle and run the generator. If you prefer to install Gradle yourself, simple instructions for setting up Gradle are below.


## The Generated Application

The default template creates a skeleton containing a commonly-used core application structure, including:

* index.html
* Application class with basic configuration (Initially set to use mock JSON data. You can add your own mock and production endpoints.)
* Initial stub for DeftJS injector config, starting with an AppConfig class
* Initial UI components:
    * Viewport
    * MainPanel
* Initial DeftJS ViewController stub:
    * MainPanelController
* Placeholder folders for:
    * Contexts (classes that manage application state and fire state-related events)
    * Services (classes that encapsulate interaction with other services, models, stores, etc.)
    * Models
    * Stores
    * Utils
* Jasmine test configuration
* Initial Jasmine specs:
    * BasicTest
    * MainPanelTest
* ANT Build file for easy compilation of CoffeeScript. Also includes an optional `docs` task to generate JSDuck API documentation for the application using the include JSDuck.exe file. (*nix users: JSDuck on *nix is installed as a Ruby Gem.) 
* Cakefile and related batch files to start CoffeeScript directory watchers for source code and test code
	
**THE GENERATED APPLICATION IS MEANT ONLY TO BE A STARTING POINT!** It will be up to you to use or remove as much of the generated application as you need to. Again, this is simply to let developers avoid mundane setup tasks and start off with something that will build and run, with a commonly-used initial configuration.


## Running the Generator

The generator is packaged using the Gradle Wrapper. On Unix, running the `gradlew` shell script will run the generator. On Windows, run the `gradlew.bat` file. 

If you're sure you already have Gradle set up on your system, you can run the generator via command line in this directory (again, if you have Gradle installed), by typing `gradle`.

The build will prompt you for 3 or 4 simple values:

* If the ./templates directory contains more than one template folder, you will be prompted to choose which template you wish to use. If there is only one template present, it will be used automatically.
* Whether you want the generator to include CoffeeScript source code and build tools for the application. Enter Y or N.
* Your application name. This will be used as the root namespace for the generated code, so use "camel case notation", like: `MyNewApp`.
* A directory chooser window will open to allow you to pick the directory to generate the new application into. **You probably want to choose a folder within your local web server**.

Once these are entered, the generator will run and the new application will be created in the target directory you chose. A recent version of the DeftJS library is included automatically, but the build will also attempt to download the latest version from Github and copy it to the generated app. Once the generator is finished, you can run the app and the tests by starting your web server and loading these URLs:

* To run the application: http://localhost/{your-app-folder}/index.html
* To run the Jasmine tests: http://localhost/{your-app-folder}/spec/jasmine-tests.html. When run in a browser, all Jasmine specs for the new application will pass.


## Customizing the Template

You're free to customize the template used by the generator or create your own template if you wish by adding additional template folders to the `./templates` directory. The default template files are located in `./templates/default`. There is also a basic [ Grails ](http://grails.org/) application template that uses DeftJS and CoffeeScript. See below for more information and caveats. 

The only items to note is that the build looks for the tokens `DeftTemplateGenerator` and `deftTemplateGenerator` to replace with the generated application name. If necessary, you can edit the token values in the `build.gradle` file, as well as change the directory path for the templates folder.


## Gradle

Gradle is a very powerful Groovy-based build system. It is similar in some ways to ANT and Maven, but is far more flexible because the build scripts are actual, executable code, rather than static XML.

1. Install Gradle. You should only need the most recent binaries-only distribution from: http://www.gradle.org/downloads
2. Unzip the downloaded library.
3. If desired, move the unzipped library from your temp folder to a permanent location.
4. If on Windows, add this to the end of the PATH variable: ;{path_where_you_put_gradle}/bin
5. Save the environment settings, then open a command prompt and type "gradle -v" to check Gradle version and ensure it is working.

Full instructions are available at the Gradle site: http://www.gradle.org/docs/current/userguide/installation.html


## The DeftJS and Grails Template

In addition to the default template, there is also an included Grails and DeftJS template. Be aware that where the default template is self-contained, the Grails template has more dependencies on your environment. So this is a more advanced, "try it if you know what you're doing" option. It is set up for Grails 2.2.1 or higher, which you would need to have installed on your system.

The template also generates IntelliJ IDEA project files, but to open this project in IDEA without warnings/errors you would need:

* The latest version of IDEA 12.1
* A Java 1.7 SDK configured within IDEA
* A Grails 2.2.1 (or higher) SDK configured within IDEA

Note that this Grails app uses the [ coffeescript-compiler ](http://grails.org/plugin/coffeescript-compiler) plugin, so the build option to exclude CoffeeScript source won't affect the generated Grails app. If you wish, you can manually delete the `/src/coffee` folder and modify the `BuildConfig.groovy` and `Config.groovy` files to remove the plugin.

In summary, you're free to run the generated Grails app however you wish to  (command line, etc.). Just keep in mind that trying to open the generated project in IDEA may reqire some additional work or troubleshooting on your part!