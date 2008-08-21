ActionController::Routing::Routes.draw do |map|

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.

  
  map.connect "Directory", :controller => "pages", :action => "member_directory"
  map.connect "Events", :controller => "pages", :action => "events"
  map.connect "Articles", :controller => "pages", :action => "articles"
  
  map.root :controller => "home"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
