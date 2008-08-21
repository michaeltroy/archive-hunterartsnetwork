class Member::ArtworksController < Member::ProfileController
  
  def new
    @artwork = Artwork.new
  end
  
  def create
    @artwork = Artwork.new(params[:artwork])
    @artwork = @active.artworks.build(params[:artwork])
      if @artwork.update_attributes(params[:profile])
        redirect_to :controller => 'member/profile', :action => :show, :id => active
        flash[:notice] = "Artwork <b>#{@artwork.filename}</b> been uploaded"
        else
        render :action => :upload
      end
  end
  
  def show
    @artwork = Artwork.find(params[:id])
  end
  
  def update
    @artwork = Artwork.find(params[:id])
    if @artwork.update_attributes(params[:artwork])
      flash[:notice] = "Artwork <b>#{@artwork.title}</b> has been updated"
    else
      flash[:notice] = "Artwork has not been updated"
    end
    redirect_to :controller => "member/artworks",
                :action => "show", :id => @artwork
  end
  
  def destroy
    @artwork = Artwork.find(params[:id]).destroy
    redirect_to :controller => 'member/profile', :action => :show, :id => active
    flash[:notice] = "Image <b>#{@artwork.filename}</b> been removed"
  end
  
end
