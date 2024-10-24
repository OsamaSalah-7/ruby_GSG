require 'rack'
require 'erb'
use Rack::Reloader, 0

# Add basic authentication
#use Rack::Auth::Basic, "Restricted Area" do |username, password|
  #password == "secret"
#end

class Greeter
  def call(env)
    request = Rack::Request.new(env) 
    case request.path
    when "/" 
      response = Rack::Response.new(render("index.html.erb", request))
      response.finish # Finish the response
    when "/change"
      response = Rack::Response.new
      response.set_cookie("greet", request.params["name"]) # Set the cookie
      response.redirect("/") # Redirect to the home page
      response.finish # Finish the response
    else 
      response = Rack::Response.new("Not Found", 404)
      response.finish # Finish the response
    end 
  end

  def render(template, request) # Accept request as an argument
    path = File.expand_path("../views/#{template}", __FILE__) 
    greeting = "Hello, #{request.cookies['greet'] || 'World'}!" # Use the cookie if it exists
    ERB.new(File.read(path)).result(binding)
  end
end

# Use Rack::Files instead of Rack::File to serve static files in the "public" folder
run Rack::Cascade.new([Rack::Files.new("public"), Greeter.new])
