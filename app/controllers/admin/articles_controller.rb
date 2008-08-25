class Admin::ArticlesController < Admin::DashboardController
  
  before_filter :access_admin_only
    
  def index
  end
  
  def list
    @articles = Article.paginate :page => params[:page], 
                                 :per_page => 12, :order => "created_at DESC"  end
  
  def new
    # @article = article.new(params[:article])
  end
  
 def create
    @article = Article.new(params[:article])
    @article = @active.articles.build(params[:article])
    if @article.update_attributes(params[:article])
      redirect_to :controller => "admin/dashboard"
      flash[:notice] = "A new article has been created"
    else
      render :action => "new"
    end
  end
  
  def show
    @article = Article.find(params[:id])
  end
  
  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = "Article has been updated"
      redirect_to :action => :show, :id => @article
    else
      render :action => :show
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    if @article.destroy
      redirect_to :controller => "admin/dashboard"
      flash[:notice] = "article has been removed"
    else
      render :template => "admin/dashboard"
      flash[:notice] = "Something went wrong. article WAS NOT removed"
    end
  end
  
end