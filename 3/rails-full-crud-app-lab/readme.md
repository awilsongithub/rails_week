---
title: Full CRUD App, with Views, Deployed
type: lab
duration: "1:25"
creator:
    name: Gerry Mathe
    city: LA
competencies: Server Applications
---


# Full CRUD App, with Views, Deployed

## Introduction

> ***Note:*** _This can be a pair programming activity or done independently._

General Assembly is opening a paperback library - yes, it's true (not really). Let's create another Rails app from scratch (WDI is about repetition) that will allow our librarian to easily keep inventory of our books.  This app will keep record and show our books, the authors, and book categories as well as the relationships that exist between each.  Since our librarian loves quick styles, try to add Twitter bootstrap styling to make your app pretty with minimal efforts!

## Exercise

#### Requirements

- Create a rails app
- Create:
	- An `Author` model with these attributes:
		- Firstname (String)
		- Lastname (String)
		- Dob (Date)
- A model `Book` with these attributes:
    - Title (String)
    - Summary (Text)
	- A model Category with these attributes:
    Name (String)
- Associations
  - An Author has many books
  - A Book Belongs to an Author
  - A Book has many categories
  - A Category has many books
- Deploy this app on Heroku
- Make sure each resource has CRUD functionality as well as RESTful routes and the corresponding views

**Bonus:**
- Add Twitter bootstrap
- Show all the books associated to a category on category#show
- Show all the books associated to an author on author#show
- Make sure the current categories are assigned when you go on the edit page for a book

#### Deliverable

Check solution-code and look below for how to structure your show pages:

<p align="center">
<img src="http://s1.postimg.org/eft4upd0f/deliverable_2.png">
</p>

## Additional Resources

- [Twitter Bootstrap Gem](https://github.com/seyhunak/twitter-bootstrap-rails)
- [Twitter Bootstrap Documentation](http://getbootstrap.com/components/)
- [Stack overflow answer for HABTM views](http://stackoverflow.com/a/27342791/503202)
