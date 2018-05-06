class HomeController < ApplicationController
  def index
    @featured_posts = Post.featured
  end
end
