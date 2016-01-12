#Models and Migrations

##Objectives
1. Be able to make relationships between models
2. Know rake commands to manage database- create, migrate, drop, seed, console
3. Know how to implement validations

##Introduction(10)
    Remember in Sinatra how we used ActiveRecord to talk to your database? It was built for rails!

    So let's try to remember why we are using ActiveRecord. In rails and sinatra, we are treating our data like objects right? 
    For example, if we are making a task website that keeps track of tasks, we might have a task object with maybe a person responsible of doing the task and the name of the task.

#### But objects are just a collection of data, how can we map them to a relational database?

Well, that's where ActiveRecord, an ORM, comes in.  ORM stands for: **O**bject **R**elational **M**apping, and it's a technique that connects the objects of an application to tables in a relational database management system.

Active Record is the M in MVC - the model 

Now let's review how to model relationships between models.

(Draw ERD of Recipe, RecipeAmount, Ingredients)

Recipe- id, name, cooktime, vegetarian
RecipeAmount- id, amount, recipe id, ingredient id
Ingredient- id, name

* Recipe has many recipe amounts
* Recipe amount belongs to recipe and ingredient
* Ingredients has many recipe amounts
* Ingredients has many recipes through recipe amounts
* Recipe has many ingredients through recipe amounts

##Demo(20)
Now let's review how to make relationships between models and how to retrieve data from the database using active record.

```
    rails new cooking_app -d postgresql
    rails g model recipe
    rails g model RecipeAmount
    rails g model ingredient
    rake db:create
    rake db:migrate
```
Now let's make the migrations

```
    Recipe
        t.string :name
        t.string :cooktime
        t.boolean :vegetarian

    RecipeAmount
        t.string :amount
        t.integer :recipe_id
        t.integer :ingredient_id

    Ingredient
        t.string :name
```
Now let's make our relationships 
```
Recipe
    has_many :recipe_amounts
    has_many :ingredients, through: :recipe_amounts
RecipeAmount
    belongs_to :recipe
    belongs_to :ingredient
Ingredient
    has_many :recipe_amounts
    has_many :recipes, through: :recipe_amounts
```
Now let's test our relationships
```
rails console

Recipe.create(name: "grilled cheese sandwhich", cooktime: "10 min", vegetarian: true)
Ingredient.create(name: "cheese")
Ingredient.create(name: "bread")
RecipeAmount.create(amount:"1 slice", recipe_id: 1, ingredient_id: 1)
RecipeAmount.create(amount:"2 slices", recipe_id: 1, ingredient_id: 2)
```
Now let's test our relationships
```
gc= Recipe.first
gc.recipe_amounts
gc.ingredients

ra1= RecipeAmount.find(1)
ra1.ingredient
ra1.recipe

cheese = Ingredient.find_by(name: "cheese")
cheese.recipes

bread= Ingredient.where(name: "bread")
```

##Codealong(20)
Now let's try it together
```
    rails new music_app -d postgresql
    rails g model Playlist
    rails g model PlaylistItem
    rails g model Song
    rake db:create
    rake db:migrate
```
Now let's make the migrations
```
    Playlist
        t.string :name

    PlaylistItem
        t.integer :playlist_id
        t.integer :song_id

    Song
        t.string :name
```
Now let's make our relationships
```
    Playlist
         has_many :playlist_items
         has_many :songs, through: :playlist_items
    PlaylistItem
        belongs_to :playlist
        belongs_to :song
    Song
      has_many :playlist_items
      has_many :playlists, through: :playlist_items
```
Now let's test our relationships
```
in seed folder:
    Playlist.create(name:"fav")
    Song.create(name:"fav")
    PlaylistItem.create(song_id:1,playlist_id:1)
in console:
    p=Playlist.first
    p.songs
    p.playlist_items
    s=Song.first
    s.playlists
```
### Validations
Now let's add validations to our models

```
playlist
    validates :name, presence: true, uniqueness: true

song
    validates :name, length: {in: 1..10}
```

  validates :name,  presence: true, length: { in: 2..30 }
  validates :email, uniqueness: true, confirmation: true
  validates :email_confirmation, presence: true

##Independent Practice(20)
Make your own app with at least one join table.
Use at least 3 different validations.
Seed your database using the seed file and `rake db:seed` command.
Test everything in rails console.

