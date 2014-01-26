class GeographicsController < ApplicationController
  def index
    @page_title = I18n.t(:geographics_link)
    
    @map = Cartographer::Gmap.new('map')
    @map.zoom = 2
    
    icons = {}
    icons[10] = "/images_#{I18n.locale}/#{I18n.t(:map_pin_blue)}"
    icons[20] = "/images_#{I18n.locale}/#{I18n.t(:map_pin_green)}"
    icons[30] = "/images_#{I18n.locale}/#{I18n.t(:map_pin_yellow)}"
    icons[40] = "/images_#{I18n.locale}/#{I18n.t(:map_pin_orange)}"
    icons[50] = "/images_#{I18n.locale}/#{I18n.t(:map_pin_red)}"
    
    # defining icons
    gicons = {}
    
    @range = params[:range]
    @range="10,20,30,40,50" unless @range
    
    [10, 20, 30, 40, 50].each do |i|
      temp_icon = Cartographer::Gicon.new(:name => "icon_#{i-10}_to_#{i}", :image_url => "#{icons[i]}",
                                           :width => 12, :height => 20,
                                           :shadow_width => 0, :shadow_height => 0, #removing shadow
                                           :anchor_x => 6, #width/2 
                                           :anchor_y => 20)
      gicons[i] = temp_icon
      @map.icons << temp_icon
    end
    
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    
    response = rsolr.find :q => "*:*", :facet => true, 'facet.field' => 'geo_location_ss', 'rows' => 0
    
    response.facets.first.items.each do |item|
      icon_in = 10
      # specify icon
      case item.hits
        when 1..10
          icon_in = 10
        when 11..20
          icon_in = 20
        when 21..30
          icon_in = 30
        when 31..40
          icon_in = 40
        else
          icon_in = 50
      end
      
      if @range.include?(icon_in.to_s)
        gicon = gicons[icon_in]
        
        location = Location.find_by_formatted_address(item.value)
        
        @map.markers << Cartographer::Gmarker.new(:name=> "#{item.value.gsub(/\W/, "_")}", :marker_type => "Building",
                          :position => [location.latitude,location.longitude],
                          :info_window_url => "/geographics/show/#{location.id}",
                          :icon => gicon) unless location.nil?
      end
    end
  end
  
  def show
    location = Location.find_by_id(params[:id])
    @location_name = location.formatted_address unless location.nil?
    
    rsolr = RSolr.connect :url => SOLR_BOOKS_METADATA
    response = rsolr.find :q => "geo_location:\"#{location.formatted_address}\""
    
    @books = {}
    
    @books_count = response.total
    
    response.docs.each do |doc|
      @books[doc["vol_jobid"]] = doc["bok_title"][0]
    end
    
    render :layout => 'main' # this is a blank layout as I don't need any layout in this action
  end
end
