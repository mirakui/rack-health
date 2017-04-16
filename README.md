[![Build Status](https://travis-ci.org/mirakui/rack-health.png)](https://travis-ci.org/mirakui/rack-health)

# What's Rack::Health
Rack::Health is a health check interface for rack applications.

# Usage
## Install
```ruby
# Gemfile
gem 'rack-health'
```

## Basic
```ruby
# config/appilcation.rb
config.middleware.insert_before 0, Rack::Health
```

```
$ curl localhost:3000/rack_health
=> 200 OK
```

## Customize url
```ruby
config.middleware.insert_before 0, Rack::Health, :path => '/healthcheck'
```

```
$ curl localhost:3000/healthcheck
=> 200 OK
```

## Customize sick condition
```ruby
config.middleware.insert_before 0, Rack::Health, :sick_if => lambda { File.exist?('/tmp/service_out') }
```

```
$ curl localhost:3000/rack_health
=> 200 OK

$ touch /tmp/service_out

$ curl localhost:3000/rack_health
=> 503 Service Unavailable
```

# License
Rack::Health is released under the MIT license:
* www.opensource.org/licenses/MIT

Copyright (c) 2012 Issei Naruta
