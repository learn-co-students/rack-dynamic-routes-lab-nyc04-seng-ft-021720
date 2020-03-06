require 'pry'
class Application




    def call(env)
        resp = Rack::Response.new
        req = Rack::Request.new(env)
        if req.path.match(/items/)
        new_item = req.path.split("/items/").last 
        item_names = @@items.map do|x| 
        x.name 
        end
        item_price = @@items.select do |x|
            x.name == new_item
        end
        
          if item_names.include?(new_item)
            resp.write "#{item_price.reduce.price}"
        else
            resp.write "Item not found"
            resp.status = 400
          end
        elsif req.path!="/items/<ITEM NAME>"
         resp.write "Route not found"
         resp.status = 404
        end
        resp.finish
    end
end
