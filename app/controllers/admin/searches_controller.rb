class Admin::SearchesController < ApplicationController

  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

   private

   def search_for(model, content, method)
     if model == 'customer'
        Customer.where('name LIKE ?', '%'+content+'%')
     else model = 'product'
        Product.where('title LIKE ?', '%'+content+'%')
     end
   end
end
