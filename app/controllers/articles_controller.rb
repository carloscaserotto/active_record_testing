class ArticlesController < ApplicationController
    def index
        @articles = Article.all
    end
    def show
        @article = Article.find(params[:id])
    end
    def new
        @article = Article.new
    end
    def create
        #byebug
        @article = Article.new(article_params)
        @article.user = User.first
        if @article.save
            flash[:notice] = "Article was created successfully."
            redirect_to articles_path
        else
            flash[:notice] = "Article was not created successfully."
            render 'new'
        end
    end
    def edit
        @article = Article.find(params[:id])
    end
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:notice] = "Article was created successfully."
            redirect_to articles_path
        else
            render 'edit'
        end
            
        
    end
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:notice] = "Article was delete successfully."
        redirect_to articles_path
    end

    private
    def article_params
        params.require(:article).permit(:title, :description, category_ids: [])
    end

end