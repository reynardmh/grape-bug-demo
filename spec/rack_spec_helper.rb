module RackSpecHelper
  include Rack::Test::Methods

  def app
    Api
  end

  def get(*args)
    @_cached_json_response = nil
    super(*args)
  end

  def put(*args)
    @_cached_json_response = nil
    super(*args)
  end

  def delete(*args)
    @_cached_json_response = nil
    super(*args)
  end

  def post(*args)
    @_cached_json_response = nil
    super(*args)
  end

  def patch(*args)
    @_cached_json_response = nil
    super(*args)
  end

  def options(*args)
    @_cached_json_response = nil
    super(*args)
  end

  def head(*args)
    @_cached_json_response = nil
    super(*args)
  end

  def json_response
    @_cached_json_response ||= JSON.parse(last_response.body)
  end

  def clear_json_response
    @_cached_json_response = nil
  end
end
