class PagesController < ApplicationController
  def home
  	@projects = Project.all.order('created_at DESC')
  end
end
