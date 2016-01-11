#Building a Rails API

###Learning Objectives
-Learn how to make a restful api with rails api gem
-Understand what private method does
-Know how to namespace routes

###Introduction(10min)
You guys have learned how to make api's in different frameworks. Now we're learning how to do it with the rails-api gem!
The rails api gem is a common gem to make a rails api, hence why we are learning it today. 
Let's review the MVC model to understand why companies use this gem. You have your models, views, and controller right?
Only views are client side, so it makes sense to separate client side from your backend right? 
Well it's quite common to use a frontend framework with a rails api. 
For example, springleaf financial uses rails api with ember. You can use rails api with react or angular if you wanted to.

###DEMO(20)
```
gem install rails-api
rails-api new to_do -d postgresql
```

Go through files and point out differences
    *Less gems in gemfile
    *In app folder there's no views nor assets
    *In controller, it inherits from APIController - lighter weight than Base

```
rails g scaffold task name
rake db:migrate
```

Doesn't generate as much code because you're not making views or assets.
Notice how this gem renders json automatically in controller.

Explain status codes

2xx Success
200 OK  :ok
201 Created :created
204 No content :no_content

4xx Client error
422 Unprocessable Entity    :unprocessable_entity

Explain private method. You don't want users to have access to this method.

Delete ```require(:task)``` from task controller.

```
rails s
```
Use postman to test api.

###Code Along(25)
```
rails-api new contacts
```

In routes add
``` 
get "/contacts", to: "contacts#index" 
post "/contacts", to: "contacts#create"
```

Then move routes in
```
namespace :api do

end
```
Add
```
def index
    @contacts = Contact.all
    render json: @contacts, status: :ok
end

def create
    @contact = Contact.new

    if @contact.save
        render json: @contact, status: :created
    else
        render json: @contact.errors, status: :unprocessable_entity
    end
end

```
###Conclusion(10)
Now you know how to make an api with rails!
You can now go on to potentially use react, angular, backbone, or ember with rails.
Recap learning objectives.

###Independent Practice(25)
Add show, edit, and delete functionality in api
Add at least one private method
Add at least one validation

```
get "/contacts/:id", to: "contacts#show"
put "/contacts/:id", to: "contacts#update"
delete "/contacts/:id", to: "contacts#destroy"
```
