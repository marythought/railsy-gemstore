# Gemstore

## Description
A Gemstore built on Angular (from the Code School tutorial 'Shape Up with Angular') and integrated with Ruby on Rails. Originally populated from a products.JSON file, but was refactored to link to a Rails persistent database. Read more about this process and my reflections on Angular at (http://marydickson.com/try-angular/).

Try it at (https://railsy-gemstore.herokuapp.com/).

## API Versioning in Rails

Three ways to version an API in Rails:

1. Namespacing -- create a route and module for your API with a "v1" (etc) folder that has its own controller. I used this approach for my gemstore. There's a [RailsCast episode](http://railscasts.com/episodes/350-rest-api-versioning) that goes pretty deep into adding additional versions while maintaining older ones so API calls won't break. The benefit to this approach: no extra gems to juggle, but a drawback is it can take more work (and less clear code) in order to get the API call to return data in the exact format you'd like. You can also tell a controller to respond to either html OR JSON (in fact, a scaffold sets it up this way for you) so that your site can be accessed either way. But if you don't need traditional html views, there are easier, cleaner ways to generate your JSON response. I found two ways to add the namespace to a Rails app, either at the end of a route (used for my gemstore): `www.mysite.com/api/v1/gemstones`, or you can prepend to the start of your site name, ex: `api.mysite.com/v1/gemstones`. The latter looks cleaner but could require additional logic if your site paths are expecting a standard path.

2. ActiveModel::Serializers -- this gem enables easy customization of json results, through the existing resource controllers. Here's [a tutorial](https://blog.engineyard.com/2015/active-model-serializers) that shows how to use serializers to customize the resulting json. There doesn't appear to be built in support for versioning with the ActiveModel::Serializers, I found [a long discussion thread](https://github.com/rails-api/active_model_serializers/issues/144) (from 2012 or so) discussing this, and the consensus seemed to be that versioning should be done with namespacing, even when using the gem.

3. JBuilder -- Several people in the discussion above mentioned that they're still JBuilder. RailsCast has [an episode about JBuilder](http://using http//railscasts.com/episodes/320-jbuilder) (from 2012). JBuilder comes built in to standard Rails, and you can use it by creating a file in "views" with .jbuilder appended to the end, like so: `index.json.jbuilder`. In that file, you can specify how you'd like the data to return in the view file or through a helper method. According to [one resource I found](http://samurails.com/gems/jbuilder/), "Jbuilder templates behave like regular html templates so you can use any helper method."

Other options to look into:

* [OJ "optimized json builder"](https://github.com/ohler55/oj) -- "A fast JSON parser and Object marshaller as a Ruby gem."
* Gem "[versionist](https://github.com/bploetz/versionist)" -- "A plugin for versioning Rails based RESTful APIs. Versionist supports three versioning strategies out of the box:
Specifying version via an HTTP header
Specifying version by prepending paths with a version slug
Specifying version via a request parameter"

## Authors

* Mary Dickson (https://github.com/marythought)

## Attribution

* (https://www.codeschool.com/courses/shaping-up-with-angular-js)
* (https://thinkster.io/angular-rails) <-- I used parts of this tutorial and parts of a Code Fellows in-class demonstration to connect Angular and Rails.
* some heavy leaning on (https://github.com/codefellows/angular_rails_oct) and in-class demo for the Angular CRUD functionality

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

MIT/X11
