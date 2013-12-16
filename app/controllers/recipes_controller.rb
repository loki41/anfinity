class RecipesController < ApplicationController
  before_filter :set_recipe, except: [:index, :new, :create]
  before_filter :login_required, :only => [:new, :create, :edit, :destroy], unless: :user_signed_in?

  
     add_breadcrumb "Cook Book", :recipes_path
  
  
   def index
     @recipes = Recipe.paginate(:page => params[:page], :per_page => 5)
   end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    add_breadcrumb @recipe.name, @recipe
    respond_to do |format|
      format.html
      format.json { render json: @recipe }
     end
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])
    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipes_path, notice: 'Recipe successfully created!!' }
        format.json { render json: @recipe }
      else
        format.html { render action: :new }
        format.json { render json: @recipe.errors }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to recipes_path, notice: 'Recipe successfully changed!!' }
        format.json { render json: @recipe }
      else
        #flash[:notice] = 'Recipe has not been changed!'
        format.html { render action: :edit }
        format.json { render json: @recipe.errors }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe successfully deleted!!'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :intructions, :ingredients, :image, :prep, :cooking, 
									 :level, :serves, :tips, :additional_info, :meta_title, :meta_description, :meta_keywords)
    end
end
