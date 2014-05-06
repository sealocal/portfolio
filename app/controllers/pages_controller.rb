class PagesController < ApplicationController
  def home
  end

  def about
    redirect_to new_connect_path
  end

  def blog
  end

  def map
  end
end
