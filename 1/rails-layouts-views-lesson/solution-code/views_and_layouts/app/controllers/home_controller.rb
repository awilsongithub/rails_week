class HomeController < ApplicationController
  def home
    # render :switch
    # render action: :switch
    # render "switch"
    # render "switch.html.erb"
    # render action: "switch"
    # render action: "switch.html.erb"
    # render "home/switch"
    # render "home/switch.html.erb"
    render template: "home/switch"
    # render template: "home/switch.html.erb"
    # render "/path/to/rails/app/views/home/switch"
    # render "/path/to/rails/app/views/home/switch.html.erb"
    # render file: "/path/to/rails/app/views/home/switch"
    # render file: "/path/to/rails/app/views/home/switch.html.erb"
  end

  def switch

  end
end
