class HogesController < ApplicationController
  def index
    @hoges = Hoge.all
  end

  def show
    @hoge = Hoge.find(params[:id])
  end

  def new
    @hoge = Hoge.new
  end

  def create
    @hoge = Hoge.new(hoges_params)
    if @hoge.save
      flash[:hoge] = "投稿完了！"
      redirect_to :action => "index"
    else
      render :action => "new"
    end
  end

  def hoges_params
    params.require(:hoge).permit(:name, :content)
  end
end
