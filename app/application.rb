
class Application
    def call(env)
      resp = Rack::Response.new
      req = Rack::Request.new(env)
   
      if req.path.match(/items/)
        stuff = req.path.split("/items/").last
        ret= @@items.detect {|i| i.name == stuff}
        resp.write "You requested #{ret}"
        if ret != nil
            resp.write ret.price
          else
            resp.write "Item not found"
            resp.status = 400
          end
      else
        resp.write "Route not found"
        resp.status = 404
      end
   
      resp.finish
    end
  end