class PagesController < ApplicationController
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
    @myVar = "Mi variable para mostrar en la vista"
  end

  def contact
  end
end
