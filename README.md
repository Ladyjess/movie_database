##Movie Tracker

The Movie Tracker app allows the user to add movies and actors. Once a list of films and actors exists, the user can create relationships where you can see what actors have been in different movies.

#Author

Jessica Hori

#Installation

To install Movie Tracker run:

```$ git clone https://github.com/Ladyjess/movie_database```

This app depends on several gems in the Gemfile so you should
got to terminal and run:

```$ bundle```

Start Postgres by running ```$ postgres```

In a new tab enter ```$ psql`` to enter the Postgres shell.

Create the database "movies" that includes these tables:

```CREATE TABLE movies (id serial PRIMARY KEY, name varchar);```

```CREATE TABLE actors (id serial PRIMARY KEY, name varchar);```

```CREATE TABLE actors_movies (id serial PRIMARY KEY, actor_id int, movie_id int);```

Start the webserver:

```$ ruby app.rb```

In your browser view the app at: localhost:4567

## License ##

GNU GPL v2.0

Report bugs via pull request and comments. Thanks!
