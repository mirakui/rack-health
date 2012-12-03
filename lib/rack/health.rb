module Rack
  class Health
    def initialize(app, options={})
      @app = app
      @options = {
        :path => '/rack_health',
        :sick_if => lambda { false },
        :body => lambda {|healthy| %Q(Rack::Health says "#{healthy ? 'healthy' : 'sick'}") },
        :status => lambda {|healthy| healthy ? 200 : 503 },
        :headers => lambda {|healthy| {'Content-Type' => 'text/plain'} }
      }.merge(options)
    end

    def call(env)
      if env['PATH_INFO'] == @options[:path]
        healthy = !@options[:sick_if].call
        status = @options[:status].call(healthy)
        body = [@options[:body].call(healthy)]
        headers = @options[:headers].call(healthy)
        [status, headers, body]
      else
        @app.call(env)
      end
    end
  end
end
