# Working with APIs and Nested Data Structures

## Objectives

1. Use Ruby to programmatically make a web request to the [Star Wars API](https://swapi.co/).
2. Use iteration and other techniques to parse a nested hash for specific information.

![](http://readme-pics.s3.amazonaws.com/star-wars.jpg)

## Overview

In this lab, we'll be using Ruby to send web requests to the Star Wars API. We'll make a web request to the API, and in return we will receive a collection of data, structured like a nested hash.

We will take that hash and parse it using iteration and other methods, in order to `puts` out some nicely formatted and extremely interesting Star Wars info for our user.

First, a little background.

## What's an API?

An **API**, or application programming interface, is a manner in which companies and organizations, like Twitter or the New York City government, or the super fans behind the Star Wars API, expose their data and/or functionality to the public (i.e. talented programmers like yourself) for use. APIs allow us to add important data and functionality to the applications we build.

We'll be learning much more about APIs later on in this course. For now, you can think of an API as one way in which data is exposed to us developers for use in our own programs.

Just like we can use Ruby to send a web request for a web page that is written in HTML, and receive a response that is full of HTML, we can use Ruby to send a web request to an API and receive a collection of JSON in return.

## What's JSON?
**JSON** is a language-agnostic way of formatting data. If we send a web request to the Star Wars API, it will return to us a JSON collection of data. With just one easy line of code, we can tell Ruby to treat that JSON collection as a nested hash. In this way, large and complicated amounts of data can be shared across platforms.

## How can Ruby Send a Web Request?

Ruby makes it super easy to send a web request. We can use the [Rest Client](https://github.com/rest-client/rest-client) gem to make it even easier!

Simply `gem install rest-client` in your terminal. Then, we can make a web request in the following manner:

```ruby
require 'rest-client'

RestClient.get('http://example.com/some-website/info')
```

Let's take a quick look at sending a web request to the Star Wars API:

```ruby
require 'rest-client'
character_data = RestClient.get('http://swapi.co/api/people/1')

puts character_data
=> "{\"name\":\"Luke Skywalker\",\"height\":\"172\",\"mass\":\"77\",\"hair_color\":\"blond\",\"skin_color\":\"fair\",\"eye_color\":\"blue\",\"birth_year\":\"19BBY\",\"gender\":\"male\",\"homeworld\":\"http://www.swapi.co/api/planets/1/\",\"films\":[\"http://www.swapi.co/api/films/6/\",\"http://www.swapi.co/api/films/3/\",\"http://www.swapi.co/api/films/2/\",\"http://www.swapi.co/api/films/1/\",\"http://www.swapi.co/api/films/7/\"],\"species\":[\"http://www.swapi.co/api/species/1/\"],\"vehicles\":[\"http://www.swapi.co/api/vehicles/14/\",\"http://www.swapi.co/api/vehicles/30/\"],\"starships\":[\"http://www.swapi.co/api/starships/12/\",\"http://www.swapi.co/api/starships/22/\"],\"created\":\"2014-12-09T13:50:51.644000Z\",\"edited\":\"2014-12-20T21:17:56.891000Z\",\"url\":\"http://www.swapi.co/api/people/1/\"}"
```

Uh-oh, you might be thinking. The `character_data` variable that we used to capture the response from the API *isn't a nested hash*, it's a crazy long ugly-looking string.

Well, not exactly. The ugly response above is actually a string of **JSON.** We can tell Ruby how to take this JSON and parse it into an easy-to-work-with Ruby hash like this:

```ruby
JSON.parse(character_data)
 => {
      "name": "Luke Skywalker",
      "height": "1.72 m",
      "mass": "77 Kg",
      "hair_color": "Blond",
      "skin_color": "Caucasian",
      "eye_color": "Blue",
      "birth_year": "19 BBY",
      "gender": "Male",
      "homeworld": "http://swapi.co/api/planets/1/",
      "films": [
          "http://swapi.co/api/films/1/",
          "http://swapi.co/api/films/2/",
          "http://swapi.co/api/films/3/"
      ],
      "species": [
          "http://swapi.co/api/species/1/"
      ],
      "vehicles": [
          "http://swapi.co/api/vehicles/14/",
          "http://swapi.co/api/vehicles/30/"
      ],
      "starships": [
          "http://swapi.co/api/starships/12/",
          "http://swapi.co/api/starships/22/"
      ],
      "created": "2014-12-09T13:50:51.644000Z",
      "edited": "2014-12-10T13:52:43.172000Z",
      "url": "http://swapi.co/api/people/1/"
}

```

That's much better!

Now that we have a pretty clear idea of how to work with APIs and use Ruby to send a web request, and parse the response into a hash, let's get started!

## Instructions

***Make sure you `gem install rest-client` in the directory of this project before you start coding!!***

### Understanding our Program

The basic structure of this lab has been provided for you. You'll be working on this project in groups of two, so one member of your pair should fork this repo, and add the other member as a collaborator.

Once you've cloned down this project onto your computer, open it up and get familiar with the file structure.

Notice that we've provided you with a `bin` directory and a `lib` directory.

The `bin` directory has one file, `run.rb`. This file is an *executable file*. That means that this is the file a user will run from the command line to execute the program. Something like this:

![](http://readme-pics.s3.amazonaws.com/Apis-and-Iteration_Screen_Cap.gif)

A user will run the program, see a lovely welcome message of your choosing, and then be prompted to enter the name of a character.

Your program will capture that input and use it to query the Star Wars API for that characters films, `puts`-ing out to the terminal, the info about the films that character has appeared in.

### `bin/run.rb`

Let's take a closer look at the content of the `run.rb` file:

```ruby
#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
character = get_character_from_user
show_character_movies(character)
```

This file requires the other files in the program, so that we can call methods defined in other files.

Why separate our program in this way? It's just more organized to separate our code according to the responsibilities of that code. This is known as the **single responsibility principle**.

First, we call the `welcome` method (which you will define in another file), then we call the `get_character_from_user` method, saving its return value to a variable, `character`. Lastly, we invoke the `show_character_movies` method, giving it an argument of the character name we captured above.

Let's takea look at how and where you will define those methods!

### `lib/api_communicator.rb`

This file is in charge of holding the code that talks to the API. It is here that we will define the methods that send requests to the API and parse the returned data from the API.

Take note of the `show_character_movies` method.

```ruby
def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end
```

It takes in an argument of a character's name (which gets passed to the method when it is called in the `run.rb` file) and relies on two helper methods that you will define to make a request to the API and parse the response from that request.

The `get_character_movies` method will take in an argument of the character's name and use the Rest Client gem to query the API *for all the characters*.

Then, the resulting JSON is parsed into a handy Ruby hash.

Your job is to iterate over that hash and collect the API URLs for the movies that character appears in.

Then, you need to make a web request to each of those URLs using Rest Client. Collect and parse the responses of each of these web requests. You should end up with an array of hashes, each of which represents a movie.

```ruby
def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

   # your code here
end
```

**Important:** You might be wondering: how do I iterate over the `character_hash` if I don't know what it looks like? Well, there are a couple of options. First of all, you can use `Pry` to freeze the program right after the `character_hash` is defined, and examine that hash in the terminal. Or, you can play around with the Star Wars API [here](https://swapi.co/). If you fill out the form to make a request to `http://www.swapi.co/people/`, you should see something like this:

```ruby
{
	"count": 87,
	"next": "http://swapi.co/api/people/?page=2",
	"previous": null,
	"results": [
		{
			"name": "Luke Skywalker",
			"height": "172",
			"mass": "77",
			"hair_color": "blond",
			"skin_color": "fair",
			"eye_color": "blue",
			"birth_year": "19BBY",
			"gender": "male",
			"homeworld": "http://swapi.co/api/planets/1/",
			"films": [
				"http://swapi.co/api/films/6/",
				"http://swapi.co/api/films/3/",
				"http://swapi.co/api/films/2/",
				"http://swapi.co/api/films/1/",
				"http://swapi.co/api/films/7/"
			],
			"species": [
				"http://swapi.co/api/species/1/"
			],
			"vehicles": [
				"http://swapi.co/api/vehicles/14/",
				"http://swapi.co/api/vehicles/30/"
			],
			"starships": [
				"http://swapi.co/api/starships/12/",
				"http://swapi.co/api/starships/22/"
			],
			"created": "2014-12-09T13:50:51.644000Z",
			"edited": "2014-12-20T21:17:56.891000Z",
			"url": "http://swapi.co/api/people/1/"
		},
		{
			"name": "C-3PO",
			"height": "167",
			"mass": "75",
			"hair_color": "n/a",
			"skin_color": "gold",
			"eye_color": "yellow",
			"birth_year": "112BBY",
			"gender": "n/a",
			"homeworld": "http://swapi.co/api/planets/1/",
			"films": [
				"http://swapi.co/api/films/5/",
				"http://swapi.co/api/films/4/",
				"http://swapi.co/api/films/6/",
				"http://swapi.co/api/films/3/",
				"http://swapi.co/api/films/2/",
				"http://swapi.co/api/films/1/"
			],
			"species": [
				"http://swapi.co/api/species/2/"
			],
			"vehicles": [],
			"starships": [],
			"created": "2014-12-10T15:10:51.357000Z",
			"edited": "2014-12-20T21:17:50.309000Z",
			"url": "http://swapi.co/api/people/2/"
		},
		{
			"name": "R2-D2",
			"height": "96",
			"mass": "32",
			"hair_color": "n/a",
			"skin_color": "white, blue",
			"eye_color": "red",
			"birth_year": "33BBY",
			"gender": "n/a",
			"homeworld": "http://swapi.co/api/planets/8/",
			"films": [
				"http://swapi.co/api/films/5/",
				"http://swapi.co/api/films/4/",
				"http://swapi.co/api/films/6/",
				"http://swapi.co/api/films/3/",
				"http://swapi.co/api/films/2/",
				"http://swapi.co/api/films/1/",
				"http://swapi.co/api/films/7/"
			],
			"species": [
				"http://swapi.co/api/species/2/"
			],
			"vehicles": [],
			"starships": [],
			"created": "2014-12-10T15:11:50.376000Z",
			"edited": "2014-12-20T21:17:50.311000Z",
			"url": "http://swapi.co/api/people/3/"
		},
		{
			"name": "Darth Vader",
			"height": "202",
			"mass": "136",
			"hair_color": "none",
			"skin_color": "white",
			"eye_color": "yellow",
			"birth_year": "41.9BBY",
			"gender": "male",
			"homeworld": "http://swapi.co/api/planets/1/",
			"films": [
				"http://swapi.co/api/films/6/",
				"http://swapi.co/api/films/3/",
				"http://swapi.co/api/films/2/",
				"http://swapi.co/api/films/1/"
			],
			"species": [
				"http://swapi.co/api/species/1/"
			],
			"vehicles": [],
			"starships": [
				"http://swapi.co/api/starships/13/"
			],
			"created": "2014-12-10T15:18:20.704000Z",
			"edited": "2014-12-20T21:17:50.313000Z",
			"url": "http://swapi.co/api/people/4/"
		},
		{
			"name": "Leia Organa",
			"height": "150",
			"mass": "49",
			"hair_color": "brown",
			"skin_color": "light",
			"eye_color": "brown",
			"birth_year": "19BBY",
			"gender": "female",
			"homeworld": "http://swapi.co/api/planets/2/",
			"films": [
				"http://swapi.co/api/films/6/",
				"http://swapi.co/api/films/3/",
				"http://swapi.co/api/films/2/",
				"http://swapi.co/api/films/1/",
				"http://swapi.co/api/films/7/"
			],
			"species": [
				"http://swapi.co/api/species/1/"
			],
			"vehicles": [
				"http://swapi.co/api/vehicles/30/"
			],
			"starships": [],
			"created": "2014-12-10T15:20:09.791000Z",
			"edited": "2014-12-20T21:17:50.315000Z",
			"url": "http://swapi.co/api/people/5/"
		},
		{
			"name": "Owen Lars",
			"height": "178",
			"mass": "120",
			"hair_color": "brown, grey",
			"skin_color": "light",
			"eye_color": "blue",
			"birth_year": "52BBY",
			"gender": "male",
			"homeworld": "http://swapi.co/api/planets/1/",
			"films": [
				"http://swapi.co/api/films/5/",
				"http://swapi.co/api/films/6/",
				"http://swapi.co/api/films/1/"
			],
			"species": [
				"http://swapi.co/api/species/1/"
			],
			"vehicles": [],
			"starships": [],
			"created": "2014-12-10T15:52:14.024000Z",
			"edited": "2014-12-20T21:17:50.317000Z",
			"url": "http://swapi.co/api/people/6/"
		},
		{
			"name": "Beru Whitesun lars",
			"height": "165",
			"mass": "75",
			"hair_color": "brown",
			"skin_color": "light",
			"eye_color": "blue",
			"birth_year": "47BBY",
			"gender": "female",
			"homeworld": "http://swapi.co/api/planets/1/",
			"films": [
				"http://swapi.co/api/films/5/",
				"http://swapi.co/api/films/6/",
				"http://swapi.co/api/films/1/"
			],
			"species": [
				"http://swapi.co/api/species/1/"
			],
			"vehicles": [],
			"starships": [],
			"created": "2014-12-10T15:53:41.121000Z",
			"edited": "2014-12-20T21:17:50.319000Z",
			"url": "http://swapi.co/api/people/7/"
		},
		{
			"name": "R5-D4",
			"height": "97",
			"mass": "32",
			"hair_color": "n/a",
			"skin_color": "white, red",
			"eye_color": "red",
			"birth_year": "unknown",
			"gender": "n/a",
			"homeworld": "http://swapi.co/api/planets/1/",
			"films": [
				"http://swapi.co/api/films/1/"
			],
			"species": [
				"http://swapi.co/api/species/2/"
			],
			"vehicles": [],
			"starships": [],
			"created": "2014-12-10T15:57:50.959000Z",
			"edited": "2014-12-20T21:17:50.321000Z",
			"url": "http://swapi.co/api/people/8/"
		},
		{
			"name": "Biggs Darklighter",
			"height": "183",
			"mass": "84",
			"hair_color": "black",
			"skin_color": "light",
			"eye_color": "brown",
			"birth_year": "24BBY",
			"gender": "male",
			"homeworld": "http://swapi.co/api/planets/1/",
			"films": [
				"http://swapi.co/api/films/1/"
			],
			"species": [
				"http://swapi.co/api/species/1/"
			],
			"vehicles": [],
			"starships": [
				"http://swapi.co/api/starships/12/"
			],
			"created": "2014-12-10T15:59:50.509000Z",
			"edited": "2014-12-20T21:17:50.323000Z",
			"url": "http://swapi.co/api/people/9/"
		},
		{
			"name": "Obi-Wan Kenobi",
			"height": "182",
			"mass": "77",
			"hair_color": "auburn, white",
			"skin_color": "fair",
			"eye_color": "blue-gray",
			"birth_year": "57BBY",
			"gender": "male",
			"homeworld": "http://swapi.co/api/planets/20/",
			"films": [
				"http://swapi.co/api/films/5/",
				"http://swapi.co/api/films/4/",
				"http://swapi.co/api/films/6/",
				"http://swapi.co/api/films/3/",
				"http://swapi.co/api/films/2/",
				"http://swapi.co/api/films/1/"
			],
			"species": [
				"http://swapi.co/api/species/1/"
			],
			"vehicles": [
				"http://swapi.co/api/vehicles/38/"
			],
			"starships": [
				"http://swapi.co/api/starships/48/",
				"http://swapi.co/api/starships/59/",
				"http://swapi.co/api/starships/64/",
				"http://swapi.co/api/starships/65/",
				"http://swapi.co/api/starships/74/"
			],
			"created": "2014-12-10T16:16:29.192000Z",
			"edited": "2014-12-20T21:17:50.325000Z",
			"url": "http://swapi.co/api/people/10/"
		}
	]
}
```

Use this tool to preview the API requests you are making for this program. Don't fly blind! Examine your data at every step of the way.

**So, the `get_character_movies_from_api` method should return an array of hashes, where each hash represents a movie.**

This array of hashes is what gets passed to the `parse_character_movies` method. This is the method in which you will iterate over that array of hashes to `puts` out movie information to the terminal.

### `lib/command_line_interface.rb`

This file is pretty basic. Define a `welcome` method that `puts` out a friendly greeting. Then, define the `get_character_from_user` method to ask the user for a characters name and capture that input. The return value of this method should be the captured user's input.

## Bonus

Once you have your program working as expected, challenge yourself. Can you add more methods so that a user can make additional queries to the API? Maybe a user should be able to input a movie name and get some movie info in return?

You can also put your refactoring skills to work. Take a closer look at the `get_character_movies_from_api` method. Does it look kind of long to you? Can you split it up into one or two helper methods?
