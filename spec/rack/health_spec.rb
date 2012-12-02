require 'rack/lint'
require 'rack/mock'
require 'rack/health'

describe Rack::Health do
  def env(url='/', *args)
    Rack::MockRequest.env_for(url, *args)
  end

  let(:base_app) do
    lambda do |env|
      [200, {'Content-Type' => 'text/plain'}, ["I'm base_app"]]
    end
  end
  let(:app) { Rack::Lint.new Rack::Health.new(base_app, rack_health_options) }
  let(:rack_health_options) { {} }
  let(:status) { subject[0] }
  let(:body) { str = ''; subject[2].each {|s| str += s }; str }

  subject { app.call env }

  describe 'with default options' do
    let(:rack_health_options) { {} }
    it { status.should == 200 }
    it { body.should == "I'm base_app" }
  end
end
