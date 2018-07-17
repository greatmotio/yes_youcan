class PostsController < ApplicationController
  def index
  	@posts = Post.all
  end

  def show
    @posts = current_user.posts.all
  end

  def new
  	@post = current_user.posts.new
  end

  def create
  	@post = Post.new(post_params)
  	if @post.save
  		flash[:notice] = 'あなたはこのゴールを達成している'
  		redirect_to post_path(current_user)
   	else
   		# render plain: @post.errors.inspect
   		render 'new'
  	end
  end

  def edit
  	@post = current_user.posts.find(params[:id])
  end

  def update
  	@post = current_user.posts.find(params[:id])
  	if @post.update(post_params)
  		flash[:notice] = '編集が完了しました'
      redirect_to post_path(current_user)
  		# redirect_to user_path(@post.user)
  	else
  		render 'edit'
  	end
  end

  def destroy
  	@post = current_user.posts.find(params[:id])
  	@post.destroy
  	flash[:notice] = '焦らずじっくりゴールを達成していきましょう'
  	redirect_to post_path(current_user)
  end

  private
  	def post_params
  		params.require(:post).permit(:content, :user_id, :image)
  	end
end
