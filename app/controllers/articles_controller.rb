class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy ]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
    #byebug
    # before_action calls set_article method that loads the @article attribute
    #@article = Article.find(params[:id])
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    #byebug
    @article = Article.new(article_params) #calls method article_params
    @article.user = User.first

    #respond_to do |format|
      if @article.save
       # format.html { redirect_to @article, notice: "Article was successfully created." }
       # format.json { render :show, status: :created, location: @article }
       flash[:notice] = "Article was successfully created."
       redirect_to @article
      else
        #format.html { render :new, status: :unprocessable_entity }
        #format.json { render json: @article.errors, status: :unprocessable_entity }
        render 'new'
      end
    #end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    #respond_to do |format| 
     # @article = Article.find(params[:id])
      if @article.update(article_params) #calls method article_params
      #if @article.update(params.require(:article).permit(:title, :description))
        #format.html { redirect_to @article, notice: "Article was successfully updated." }
        #format.json { render :show, status: :ok, location: @article }
        flash[:notice] = "Article was successfully updated."
        redirect_to @article
      else
        #format.html { render :edit, status: :unprocessable_entity }
        #format.json { render json: @article.errors, status: :unprocessable_entity }
        render 'edit'
      end
    #end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
   # @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
    #respond_to do |format|
      #format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      #format.json { head :no_content }
   # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:title, :description)
    end
end
