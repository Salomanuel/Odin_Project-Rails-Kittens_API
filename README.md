Ruby on Rails >> APIs, Mailers and Advanced Topics >> [Project: APIs](https://www.theodinproject.com/courses/ruby-on-rails/lessons/apis)


# Project 1: Building a Simple Kittens API

## HTML

We'll start by building our Kitten application to work normally in the browser with HTML.

1. Set up a new Rails application (`odin-kittens`) and Git repo
2. Update the `README` to describe the application and link back to this project.
3. Build a `Kitten` model with attributes of `:name`, `:age`, `:cuteness`, and `:softness`.
4. Build a `KittensController` and `:kittens` routes for all 7 RESTful actions.
5. Set your default route to `KittensController#index`
6. Fill out each of your controller actions and their corresponding views to display a very basic HTML page -- `#index` should just list all Kittens, `#show` should display a single Kitten, `#new` should render a simple Kitten creation form, `#edit` should use the same form (which should be a partial used by both the New and Edit views) to Edit the Kitten, `#create` and `#update` should do their jobs.
7. Make a `delete` link on the Kitten's Show and Edit pages, as well as next to each Kitten listed in the Index page.
8. Implement a simple display of the `flash` hash (like you did in the tutorial) which congratulates you on adding or editing or deleting kittens and makes fun of you for errors in your form.
9. Test out your Kitten creation machine to make sure all your controller actions are running properly.

## JSON API

Now it's time to make the Kittens resource available via API.

1. Open a new command line tab and fire up IRB. `> require 'rest-client'` (you may need to `$ gem install rest-client` if you haven't already). Test it out by making a request to your application using `> response = RestClient.get("http://localhost:3000/kittens")`
2. You should get a sloppy mess of HTML. If you check out your server output, it's probably processing as XML, e.g. `Processing by KittensController#index as XML`
3. Try asking specifically for a `JSON` response by adding the option `:accept => :json`, e.g. `RestClient.get("http://localhost:3000/kittens", :accept => :json)`. It should throw an error.
4. Now modify your `KittenController`'s `#index` method to `#respond_to` `JSON` and render the proper variables.
5. Test it out by making sure your `RestClient` calls return the proper `JSON` strings.
6. Do the same for your `#show` method, which will require you to provide an `ID` when making your request. Your CSRF protection will prevent you from creating, updating or deleting kittens via the API, so it's not necessary to implement those.

This project may seem simple, but now you've got a website that is both a normal HTML-producing back end AND an API that can be used to pull data from it. You could use Javascript calls from the front end to dynamically refresh your data now or even to load the whole page in the first place. Or maybe you'll be hooking up a Kittens app to your iPhone and need a back end. It doesn't matter, since now you've got a RESTful API.