module DarviewerHelper
  def get_annotations(params)
    guid = params[:SSOToken]
    user = User.find_by_guid(guid)
    jobid = params[:PID].gsub("DAF-Job:", "")
    jsonArray = []
    annotations = Annotation.find_by_sql("SELECT * FROM annotations
                          WHERE annotations.user_id = #{user.id}
                          AND annotations.volume_id = #{jobid}")
    
    annotations.each do |annotation|
      element = {#'Color' => annotation.color != nil ? annotation.color : "" ,
                'ID' => annotation.id != nil ? annotation.id : "" , 
                'PID' => annotation.volume_id != nil ? annotation.volume_id : "",
                'Text' => annotation.text ? annotation.text : "",
                'Height' => annotation.height != nil ? annotation.height : "",
                'locX' => annotation.location_x != nil ? annotation.location_x : "",
                'locY' => annotation.location_y != nil ? annotation.location_y : "",
                'Page' => annotation.page_id != nil ? annotation.page_id : "",
                'HLType' => annotation.hltype != nil ? annotation.hltype : "",
                'Width' => annotation.width != nil ? annotation.width : "",
                'ZOrder' => annotation.zorder != nil ? annotation.zorder : "",
                'Type' => annotation.anntype != nil ? annotation.anntype : ""
      }  
      jsonArray << element
    end
    jsonArray
  end
  
  def save_annotation(params)
    guid = params[:SSOToken]
    user = User.find_by_guid(guid)
    jobid = params[:PID].gsub('DAF-Job:', "")
    
    #For spelling mistake of Height "Hight" in the dar team
    height = params[:Height] ? params[:Height] : params[:Hight] ? params[:Hight] : nil
    attributes = {
      'volume_id' => jobid != nil ? jobid : nil, 
      'page_id' => params[:Page] != nil ? params[:Page] : nil,
      'text' => params[:Text] != nil ? params[:Text] : nil, 
      'anntype' => params[:Type] != nil ? params[:Type] : nil,
      'location_x' => params[:LocX] != nil ? params[:LocX] : nil,
      'location_y' => params[:LocY] != nil ? params[:LocY] : nil,
      'height' => height != nil ? height : nil,
      'width' => params[:Width] != nil ? params[:Width] : nil,
      'zorder' => params[:ZOrder] != nil ? params[:ZOrder] : nil,
      'hltype' => params[:HL_Type] != nil ? params[:HL_Type] : nil,
      #'created_at' => params[:Note_Date] != nil ? params[:Note_Date] : nil,
      'user_id' => user.id
    }
    
    annotation = Annotation.create(attributes)
    jsonArray = {'ID' => annotation.id, 'TID' => params[:TID]}
    
  end
  
  def edit_annotation(params)
    jobid = params[:PID].gsub('DAF-Job:', "")
    
    #For spelling mistake of Height "Hight" in the dar team
    height = params[:Height] != nil ? params[:Height] : params[:Hight] != nil ? params[:Hight] : nil;
    attributes = {
      'id' => params[:ID],
      'volume_id' => params[:jobid] != nil ? jobid : nil, 
      'page_id' => params[:Page] != nil ? params[:Page] : nil,
      'text' => params[:Text] != nil ? params[:Text] : nil, 
      'anntype' => params[:Type] != nil ? params[:Type] : nil,
      'location_x' => params[:LocX] != nil ? params[:LocX] : nil,
      'location_y' => params[:LocY] != nil ? params[:LocY] : nil,
      'height' => height != nil ? height : nil,
      'width' => params[:Width] != nil ? params[:Width] : nil,
      'zorder' => params[:ZOrder] != nil ? params[:ZOrder] : nil,
      #'date' => params[:Note_Date] != nil ? params[:Note_Date] : nil,
      'hltype' => params[:HL_Type] != nil ? params[:HL_Type] : nil
    }
    
    annotation = Annotation.find(params[:ID])
    success = annotation.update_attributes(attributes)
    jsonArray = {'Succeeded' => success,'TID' => params[:TID]}
  end
  
  def remove_annotation(params)
    guid = params[:SSOToken]
    user = User.find_by_guid(guid)
    
    success = false
    begin
      annotation = Annotation.find params[:ID]
    rescue ActiveRecord::RecordNotFound => e
      annotation = nil
    end
    if annotation != nil && annotation.delete() != nil
      success = true
    end
    jsonArray = {'Succeeded' => success,'TID' => params[:TID]}
  end
end