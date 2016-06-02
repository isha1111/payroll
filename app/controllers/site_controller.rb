class SiteController < ApplicationController

  def new
  end

  def create
    site = Site.new
    site.site_name = params[:sname]
    site.site_location = params[:slocation]
    site.save
    redirect_to '/admin/login'
  end

  def show
  end

  def delete
    site = Site.find_by(id: params[:id])
    site.delete
    redirect_to '/admin/login'
  end

  def edit
    site = Site.find_by(id:params[:id])
    site.site_name = params[:sname]
    site.site_location = params[:slocation]
    site.save
    redirect_to '/admin/login'
  end

end
