
class Greeter
  def call(env)
    response = Rack::Response.new
    response['Content-Type'] = 'text/plain'
    response.write("Hello World!")
    response.finish
  end
end
