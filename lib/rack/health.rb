module Rack
  class Health
    def initialize(app, options={})
      @app = app
      @options = {}
    end

    def call(env)
      @app.call(env)
    end
  end
end
