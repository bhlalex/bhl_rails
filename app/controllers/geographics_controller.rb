class GeographicsController < ApplicationController
  def index
    @page_title = 'Geographics'
    
    @map = Cartographer::Gmap.new( 'map' )
    @map.zoom = 2
    @map.icons << Cartographer::Gicon.new
    
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    
    response = rsolr.find :q => "*:*", :facet => true, 'facet.field' => 'geo_location_ss', 'rows' => 0
    
    response.facets.first.items.each do |item|
      location = Location.find_by_formatted_address(item.value)      
      @map.markers << Cartographer::Gmarker.new(:name=> "#{item.value.gsub(/\W/, "_")}", :marker_type => "Building",
                        :position => [location.latitude,location.longitude],
                        :info_window_url => "#{location.id}")
    end
  end
  
  def show
    location = Location.find_by_id(params[:id])
    @location_name = location.formatted_address unless location.nil?
    
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    response = rsolr.find :q => "geo_location:#{location.formatted_address}"
    
    @books = {}
    
    @books_count = response.docs.count
    
    response.docs.each do |doc|
      @books[doc["vol_jobid"]] = doc["bok_title"][0]
    end
    
    render :layout => 'main' # this is a blank layout as I don't need any layout in this action
  end
end
