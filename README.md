#Hungryform Rails [![Build Status](https://travis-ci.org/andrba/hungryform-rails.svg?branch=master)](https://travis-ci.org/andrba/hungryform-rails)

This gem is an adaptor between the [HungryForm](http://github.com/andrba/hungryform) gem and Rails. 

![image](https://cloud.githubusercontent.com/assets/2174682/7443144/f07081bc-f179-11e4-921d-cbb4ded02776.png)

##Installation:

Add the hungryform gem to your Gemfile:
```ruby
gem "hungryform-rails"
```

Add the Hungryform require to your application.js:
```
//= require hungryform
```

Add the Hungryform require to your application.css:
```
//= require hungryform
```

Use the following helper to generate the form in your views:

```ruby
<%= hungry_form_for(@form) %>
```

##Configuration

This gem extends the configuration options provided by Hungryform. Create initializer in ```config/initializers/hungryform.rb``` and place the configuration code inside:

```ruby
Hungryform.configure do |config|
  config.rails.elements_templates = 'hungryform'
end
```

