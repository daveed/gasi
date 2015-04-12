# Gasi

## Description 

'One Stop Before Mars' suggests a mission to find the best asteroids for a more economic solution.
* A "space version of gas station/ fuel depot" or "Asteroid sustainable energy converter" as a transition spot or a space station, that will allow space ships to recharge in-between their trajectory on the way to Mars. 
* The asteroid will be suggested by an 'asteroid calculator' simulation, similar to a 'GPS for asteroid converter ' that provides resulting choices of which Asteroid where the spaceships in mission will do its stop. 


## Getting Started

Asteroid data imported from the IAU Minor Planet Center database

    % http://minorplanetcenter.net/mp_properties.sql.gz

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [foreman]:

    % foreman start

If you don't have `foreman`, see [Foreman's install instructions][foreman]. It
is [purposefully excluded from the project's `Gemfile`][exclude].

[foreman]: https://github.com/ddollar/foreman
[exclude]: https://github.com/ddollar/foreman/pull/437#issuecomment-41110407

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)
