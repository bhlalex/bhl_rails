class UbioController < ApplicationController
  def index
    status = params[:status] != nil ? params[:status] : '' 
    query = ''
    @fail = false
    case status
    when 'done'
      query = ' ubio_in_dar_fail=0 '
    when 'fail'
      query = ' ubio_in_dar_fail>0 '
    when 'pending'
      query = ' ubio_in_dar_fail IS NULL '
    else
      @fail = true
    end
    if !@fail
      volumes =  Volume.find(:all, :select => 'job_id' ,:conditions => ["get_pages_names_fail IS NULL AND #{query}"])
      jobs = []
      volumes.each do |item|
        jobs << item.job_id
      end
      
      j = ActiveSupport::JSON
      @json = j.encode({ :jobids => jobs })
    end
    render layout: 'ubio'
  end
  def show
    id = params[:id] != nil ? params[:id] : ''
    @fail = false
    volume =  Volume.find_by_job_id(id);
    if volume == nil
      @fail = true
    else
      #get all names within volume
      names = Name.find_by_sql("SELECT DISTINCT names.id, names.string  FROM names 
                            INNER JOIN page_names on (names.id=page_names.name_id)
                            INNER JOIN pages on (pages.id=page_names.page_id)
                            WHERE pages.volume_id=#{volume.id} ORDER BY names.string;")
      names_arr = {}
      names.each do |name| #foreach name, get all forms of this name within book
        string = name.string;
        terms = PageName.find_by_sql("SELECT DISTINCT page_names.namestring
                    FROM  pages  
                    INNER JOIN page_names on (pages.id=page_names.page_id)
                    Where pages.volume_id=#{volume.id}
                    AND name_id=#{name.id}")
        if terms.length > 0
          names_arr[string] = []
          t_ar = []
          terms.each do |term|      
            t_ar << term.namestring
          end
          names_arr[string] = t_ar
        end
      end
      
      pages_arr = {}
      pages = Page.find_all_by_volume_id(volume.id)
      pages.each do |page|
        pnum = page.page_number
        names = PageName.find_by_sql("SELECT DISTINCT names.string
                    FROM names 
                    INNER JOIN page_names ON  (names.id=page_names.name_id)
                    Where page_id=#{page.id}")
        if names.length > 0
          pages_arr[pnum] = []
          n_ar = []
          names.each do |name|
            n_ar << name.string
          end
          pages_arr[pnum] = n_ar 
        end
      end
      #arr_object = {:Canonicals => names_arr, :Pages => pages}
      result_array = {:Canonicals => names_arr, :Pages => pages_arr}
      j = ActiveSupport::JSON
      @json = j.encode(result_array) 
    end
    render layout: 'ubio'
  end
  def edit
    id = params[:id] != nil ? params[:id] : ''
    success = params[:success] != nil ? params[:success] : 0
    @fail_message = ''
    if id == '' || ()
      @fail_message = "#{I18n.t(:ubio_enter_jobid)}"
    elsif success == '' || (success != '0' && success != '1')
      @fail_message = "#{I18n.t(:ubio_enter_status)}"
    else
      volume =  Volume.find_by_job_id(id)
      if volume == nil
        @fail_message = "#{I18n.t(:ubio_wrong_jobid)}"
      else
        if success == '0'          
          volume.ubio_in_dar_fail = volume.ubio_in_dar_fail == nil ? 1 : volume.ubio_in_dar_fail + 1 
        elsif success == '1'
          volume.ubio_in_dar_fail = 0
        end
        volume.save()
        result_array = {:jobid => id, :ubio_failure_count => volume.ubio_in_dar_fail}
        j = ActiveSupport::JSON
        @json = j.encode(result_array)
      end
    end
  end
end