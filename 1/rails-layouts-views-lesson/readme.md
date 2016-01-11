
---
title: Layouts, Partials, and Views
type: lesson
duration: "1:25"
creator:
    name: Gerry Mathe
    city: London
competencies: Server Applications
---

# Layouts, Partials, and Views

### Objectives
*After this lesson, students will be able to:*

- Describe how templates & views work together
- Use partials for static content and rendering dynamic content

### Preparation
*Before this lesson, students should already be able to:*

- Write HTML
- Describe how to yield a template in a layout
- Use Ruby instance variables in templates
- Use params to store data in instance variables

## Views in Rails - Intro (10 mins)

In this lesson we will cover the details of rendering views and best practices for keeping the views DRY.


With Sinatra, we've seen that if there is a file called `layout.erb`, this file will be used as the app layout by default.

If this file `layout.erb` contains a yield statement `<%= yield %>`, then the template rendered for the current route will be "injected" where the yield statement is in the layout.  Combined, the templates and layouts will be sent back to the client.

This logic is pretty much the same with Ruby on Rails. When the app is created, Rails will automatically add a layout `application.html.erb` in `app/views/layouts/application.html.erb`. This layout already contain a yield statement and all the links to css and js files in the head part of the html document.

## Using views with Rails - Demo (20 mins)
add `get '/about_me'=> 'home#about_me'` to route in routes.rb
`rails g controller home`
add `def about_me end` to home controller

In Rails, the logic for the rendering a view is quite straightforward. Given that every route in Rails will execute a method inside a controller, when the method is executed, Rails will look for:

1. A folder inside view corresponding to the controller's name (folder `home` for `HomeController`).
2. A file named `about_me.html.erb`.

For example , if we call `http://localhost:3000/posts`, Rails will execute the method `index` in the controller `posts` and then, look for a view located in `app/views/posts/index.html.erb`  This works when the method always renders the same view.

In some cases though, you may want to render a view with a different name than the current method. 

For example: if a post was saved successfully go to the index page, otherwise go back to the form.

To sum it up, Rails will, by default, render the view that has the name of the current method in the controller, unless there is a `render`statement in the method that tells Rails to use a different view.

`touch app/views/home/switch.html.erb`

There are different syntaxes for render, and they all do the same action described above; but the rule of thumb is to use the simplest one that makes sense for the code you are writing.

> Note: Review and explain each of the render functions below.

```ruby
    render :switch
    render action: :switch
    render "switch"
    render "switch.html.erb"
    render action: "switch"
    render action: "switch.html.erb"
    render "home/switch"
    render "home/switch.html.erb"
    render template: "home/switch"
    render template: "home/switch.html.erb"
    render "/path/to/rails/app/views/home/switch"
    render "/path/to/rails/app/views/home/switch.html.erb"
    render file: "/path/to/rails/app/views/home/switch"
    render file: "/path/to/rails/app/views/home/switch.html.erb"
```

## Integrating Layouts - Codealong (30 mins)

#### Different Layouts

By default, Rails will render the layout `application.html.erb` - just like `layout.html.erb` in Sinatra - but sometimes, you want to render a template in a different layout.

For instance, let's create a layout called `sidebar.html.erb`

```bash
touch app/views/layouts/sidebar.html.erb
```

Take this template and add it into the `sidebar.html.erb`:

```html
<!DOCTYPE html>
<html>
<head>
  <title>Sidebar Template</title>
</head>
<body>
  <header>
    <h1>My Website</h1>  
    <ul>
      <li>Menu 1</li>
      <li>Menu 2</li>
      <li>Menu 3</li>
      <li>Menu 4</li>
    </ul>
  </header>
  <main>
    <%= yield %>
  </main>
  <footer>
    <ul>
      <li>About us</li>
      <li>Team</li>
      <li>Terms and conditions</li>
    </ul>
  </footer>
</body>
</html>
```

This will help us to differentiate the layouts.

In the controller method `index`, add this to the end of the method:

```ruby
render layout: "sidebar"
```

This line will just tell Rails to use the same logic of template rendering, but instead of using the default `application.html.erb`, it will render the template inside `sidebar.html.erb`.

You can also do `render layout: false` if you wanted to use ajax to pull in a view.
## Conclusion (10 mins)

#### Questions

- Where do we use the method `render` (2 places)
- What is the easiest way to go to the show page of a restful controller from another method in this controller?
- How to render a different layout only for one method?

