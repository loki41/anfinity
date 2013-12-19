class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :login_required, :only => [:new, :create, :edit, :destroy], unless: :user_signed_in?
  before_action :recent, :archive, :cats, only: [:index, :show]

  add_breadcrumb "Blog", :posts_path
  
  # GET /posts
  # GET /posts.json
  def index
    if params[:month]
      @posts = filter_month.to_a.paginate(page: params[:page], per_page: 5)
    elsif params[:year]
	  @posts = filter_year.to_a.paginate(page: params[:page], per_page: 5)
	elsif params[:cat]
	  filter_cats
	elsif params[:tag]
	  @posts = Post.tagged_with(params[:tag]).paginate(page: params[:page], per_page: 5)
    else
      @posts = Post.all.paginate(page: params[:page], per_page: 5)
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    set_post
    
	  add_breadcrumb @post.title, @post
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end
  
  def filter_month
    @posts.delete_if { |y| y.created_at.strftime("%Y") != params[:year] }.delete_if { |m| m.created_at.strftime("%m") != params[:month] }
  end
  
  def filter_year
    @posts.delete_if { |y| y.created_at.strftime("%Y") != params[:year] }
  end
  
  def filter_cats
	  @posts.delete_if { |c| c.category.to_i != params[:cat].to_i }
  end
  
  def recent
    @recent = Post.limit(5)
  end
  
  def archive
    @posts = Post.all
    @archive = Hash[ @posts.group_by{|y| y.created_at.year}.map{|k,v| [k,v.group_by{|m| m.created_at.strftime("%B")}]} ]
  end
  
  def cats
    @cats = Category.all
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content, :category, :tag_list, :comment, :created_at, :meta_title, :meta_description, :meta_keywords, :created_at)
    end
end