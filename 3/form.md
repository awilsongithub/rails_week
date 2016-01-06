## Rails Form Helpers

![Form Helpers](http://ga-chicago.github.io/darth-vader/07_ruby_on_rails/d02/rails_form_helpers.jpg)

Today we created a **Shopping List** application. The source code is available here: https://github.com/ga-chicago/Rails_Shopping_List

#### Define a Model

```ruby

def new
  # create a new model
  @product = Product.new
end

```

#### Create a Form Helper in a view

```html
<h1>Add To List</h1>

<h3>New Product</h3>
<%= form_for @product, url: {action: 'create'} do |f| %>
  <%= f.text_field :name %>
  <%= f.text_field :quantity %>
  <%= f.submit 'Add Item' %>
<% end %>
```

#### Handling params

```ruby
def create
  # POST request
  # save that model
  @product = Product.create(
    :name => params[:product][:name],
    :quantity => params[:product][:quantity].to_i
  )

end

def delete
  # find the model
  # delete it
  @product = Product.find(params[:product][:id].to_i).destroy

end
```
