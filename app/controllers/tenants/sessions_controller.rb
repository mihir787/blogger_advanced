class Tenants::SessionsController < ApplicationController
  def new
  end

  def create
    tenant = Tenant.find_by(slug: params[:slug])
    author = tenant.authors.find_by_email(params[:email])

    if author && author.authenticate(params[:password])
      session[:author_id] = author.id
      redirect_to tenant_account_path(slug: tenant.slug), notice: "Logged in as #{current_author.name}"
    else
      flash.now[:notice] = "Your account is invalid. Please Try Again."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: 'Logged out'
  end
end
