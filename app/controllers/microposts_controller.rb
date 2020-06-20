class MicropostsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy

    def index
      @microposts = Micropost.all
    end

    def create
      @micropost = current_user.microposts.build(micropost_params)
      if @micropost.save 
        flash[:success] = "Micropost created!"
        redirect_to root_url
      else
        q = Micropost.none.ransack
        @feed_items = []
        render 'static_pages/home'
      end
    end

    def show
      @micropost = Micropost.find(params[:id])
    end

    def edit
      @micropost = Micropost.find(params[:id])
    end

    def update
      @micropost = Micropost.find(params[:id])
      if @micropost.update_attributes(micropost_params)
        redirect_to micropost_path
        flash[:success] = "変更完了！"
      else
        render 'edit'
      end
    end


    def destroy
        @micropost.destroy
        flash[:success] = "Micropost deleted"
        redirect_to root_url
    end

    def micropost_params
        params.require(:micropost).permit(:content,:picture)
    end

    def correct_user
        @micropost = current_user.microposts.find_by(id:params[:id])
        redirect_to root_url if @micropost.nil?
    end

  private
  
    def micropost_params
      params.require(:micropost).permit(:content)
    end
end
