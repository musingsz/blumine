class UsersController < ApplicationController
  before_filter :must_login_first, :only => :show
  before_filter :must_not_logged_in, :only => [:new, :create]

  def new
    @user = User.new
    @title = t(:register)
    breadcrumbs.add t(:register), register_path
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name

    breadcrumbs.add @user.name
  end

end
