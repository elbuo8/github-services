require File.expand_path('../helper', __FILE__)

class ConductorTest < Service::TestCase
  def setup
    @stubs = Faraday::Adapter::Test::Stubs.new
  end

  def test_push
    url = "/github/commit/abc123def456"
    @stubs.post url do |env|
      [200, {}, '']
    end

    svc = service({'api_key' => 'abc123def456'}, payload)
    svc.receive_push
  end

  def service(*args)
    super Service::Conductor, *args
  end
end
