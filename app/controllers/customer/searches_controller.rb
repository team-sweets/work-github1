class Customer::SearchesController < ApplicationController

 def search
    @model = params["model"]
    @method = params["method"]
    @content = params["content"]
    @records = search_for(@model, @content, @method)
 end

  private

  def search_for(model, content, method)
     model = 'product'
     Product.where('name LIKE ?', '%'+content+'%')
  end
end
