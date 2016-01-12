##Objectives

##Introduction
rails new library_app
rails g model book checked_out:boolean title:string
rails g controller book index show new create edit update destroy

Book
validates :title, presence: true;

touch app/views/books/_form.html.erb

```html
<%= form_for(@book) do |f| %>
    <%= f.label :title %>
    <%= f.text_field :title %><br>
    <%= f.hidden_field :checked_out, value: @checked_out %>

    <%= f.submit %>
<% end %>
```

touch app/views/books/edit.html.erb
touch app/views/books/index.html.erb
touch app/views/books/new.html.erb
touch app/views/books/show.html.erb

###Form Helpers
* text_field
* password_field
* text_area
* hidden_field
* radio_button
* check_box
* file_field
* label

##DEMO

##Code Along

##Conclusion

##Independent Practice
