# README

### Objective

Objective is to create an electronics store.
The user experience **UX** comprises **User Stories** that I have included in [Trello](https://trello.com/b/hxjx7GZe/electronics)

We want to use Stripe to charge users when they purchase an electronics product. We will create the following resources:
* User - id, email, stripe_id,
* Product - name
* Charges - id, stripe_charge_id, stripe_charge_token


### Steps that I followed to create this application

* Show Atom Markdown Plugin https://github.com/atom/markdown-preview
  * Go to Atom menu: Packages > Markdown Preview > Toggle Preview (or SHIFT+CTRL+M)

* Create Rails app. Note: It automatically runs `bundle install`
  ```sh
  rails new electronics -d=postgresql
  ```

* Run the Rails server
  ```sh
  rails s
  ```

* Opened the Root route (i.e. `/`) in web browser http://localhost:3000/.
  ```sh
  open -a "Google Chrome" http://localhost:3000/
  ```
  * Note: Initially a default Rails app does not have any routes defined yet in ./config/routes.rb
  * Refer to [Rails Getting Started Guide](http://guides.rubyonrails.org/getting_started.html)

* Check what routes are defined in ./config/routes.rb.
  ```
  rails routes
  ```
  * Note: Initially there you don't have any routes defined!

* Create a Root Route in ./config/routes.rb that recognize a URLs and connect these incoming requests to controllers and actions
  * ./config/routes.rb
  ```ruby
  root 'product#index'
  ```
  * Note: Since our **Objective** is to create a
  * References
    * [Rails Getting Started Guide](http://guides.rubyonrails.org/getting_started.html)
    * [Rails Routing]( http://guides.rubyonrails.org/routing.html)


* Create a Controller and controller Action for the Route
  * Add User with Devise https://github.com/plataformatec/devise
    * Add to Gemfile and bundle install
    * Run the Devise Generator
      ```
      rails generate devise:install
      ```
    * Generate User with Devise
      ```
      rails g devise User
      ```
    * Generate User Views for Devise so we can edit them
      ```
      rails generate devise:views users
      ```
  * Create a Product resource that ultimately stores an image using the [Shrine Gem](https://github.com/janko-m/shrine) and it references a User (since User has many Products)
    ```
    rails g scaffold Product name:string user:references
    ```
  * See ![Rails MVC](/app/assets/images/rails_mvc.jpg?raw=true "Rails MVC")

* Show the routes
  ```
  rails routes
  ```

* Configure the routes.rb to default to the Product List view (i.e. `products#index`)
  ```
  root to: 'products#index'
  ```

* Update Models with associations
  * User Model
    ```
    has_many :products
    ```
  * Product Model
    ```
    belongs_to :user
    ```
  * Experiment in Rails console
    ```
    rails console
    ```

* Create and Migrate into the Database
  ```
  rails db:create db:migrate
  ```

* Restart the server
  ```
  rails s
  ```