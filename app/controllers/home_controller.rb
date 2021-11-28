class HomeController < ApplicationController
  def index
    gon.email = current_user.email
  end
end
