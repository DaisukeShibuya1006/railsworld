# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :logged_in_user, only:[:edit, :update, :show, :destroy,
                                :following, :followers]
  before_action :correct_user, only:[:edit, :update]
  before_action :admin_user, only: :destory

  def index
    # @users = User.paginate(page: params[:page])
    if params[:q]
      @q = User.ransack(search_params, activated_true: true)
      @title = "Search Result"
    else
      @q = User.ransack(activated_true: true)
      @title = "All users"
    end
    @users = @q.result.paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = 'Welcome to the Sample App!'
      redirect_to @user
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    # redirect_to root_url and return unless @user.activated?
    # if params[:q] && params[:q].reject {|key, value| value.brank? }.present?
    #   @q = @user.microposts.ransack(microposts_search_params)
    #   @microposts = @q.result.paginate(page: params[:page])
    # else
    #   @q = Micropost.none.ransack
    #   @microposts = @user.microposts.paginate(page: params[:page])
    # end
    # @url = user_path(@user)
  end

  def edit
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.paginate(page: params[:page])
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def admin_user
    redirect_to (root_url) unless current_user.admin?
  end

  def search_params
    params.require(:q).permit(:name_cont)
  end
end
