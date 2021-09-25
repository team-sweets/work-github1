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
        Customer.where('first_name LIKE ?', '%'+content+'%').
        or Customer.where('last_name LIKE ?', '%'+content+'%')
     else model = 'product'
        Product.where('name LIKE ?', '%'+content+'%')
     end
   end
end
