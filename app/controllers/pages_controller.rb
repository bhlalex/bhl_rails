class PagesController < ApplicationController
  include SolrHelper
  include BooksHelper
  include LogActivitiesHelper
  layout 'pages'
 
  def about
    @page_title = I18n.t(:about_us_page_title)
  end

  # provide users with form to send email to site master
  def contact
    @page_title = I18n.t(:contact_us_page_title)
    @email_message = EmailMessage.new
    @verify_captcha = true
  end

  # send_message: to send email message to site master
  # using enterd name, email, subject and message body entered by user
  # also store email message paramters in email_messages table
  def send_message
    @email_message = EmailMessage.new(params[:email_message])
    if @email_message.valid? && verify_recaptcha
      @email_message.save
      # use action mailer to send email message incase of valid message paramteres
      if Notifier.contact_message(params[:email_message][:name],params[:email_message][:email],
      params[:email_message][:subject],
      params[:email_message][:message]).deliver
        flash.now[:notice] = I18n.t(:contact_us_message)
        flash.keep
      end
      redirect_to :controller => :pages, :action => :contact
    else
      @verify_captcha = true
      @page_title = I18n.t(:contact_us_link)
      @email_message.errors.add('recaptcha', I18n.t("form_validation_errors_for_attribute_assistive")) unless verify_recaptcha
      render 'contact'
    end
  end

  def home
    # for info part
    prepare_info_part
    
    #for top collections part
    prepare_top_collections_part
    
    #for most viewed books
    prepare_most_viewed_books_part
    
    #for top rated books
    prepare_top_rated_books_part
    
    #for activity log part
    @act_no = get_log_records.count 
    @act_pages = get_log_records.count > 0 ? (get_log_records.count.to_f/HOME_LOG_ACTIVITIES).ceil : 0
  end
  
  def get_activity_log
    @log_records = get_log_records
    # applying pagination on log_records array
    @pages = params[:pages]
    page = params[:start].to_i
    @start = page
    limit = HOME_LOG_ACTIVITIES
    offset = (page > 1) ? (page - 1) * limit : 0 
    @log_records = @log_records[offset,limit]
    respond_to do |format|
      format.html {render :partial => "pages/get_activity_log"}
    end
  end
  
  private
  def prepare_info_part
    @no_of_books = get_count_of("book")
    @no_of_authors = get_count_of("author")
    @no_of_species = get_count_of("name")
  end
  
  def prepare_top_collections_part
    sql_query = "is_public = true"
    @top_collections = Collection.where(sql_query).order("rate desc").limit(TOP_COLLECTIONS_COUNT).offset(0)
  end
  
  def prepare_most_viewed_books_part
    page = 1
    sort = "views desc"
    @most_viewed_response = search_facet_highlight( "*:*", page, MOST_VIEWED_BOOKS, sort)
  end
  
  def prepare_top_rated_books_part
    page = 1
    sort = "rate desc"
    @top_rated_response = search_facet_highlight( "*:*", page, MOST_VIEWED_BOOKS, sort)
  end
  
  def get_log_records
    sql_stmt = "SELECT
      result.table_type AS table_type,
      result.id AS id,
      result.time AS time
      FROM
      (
      (SELECT
          'collection' AS table_type,
          id AS id,
          created_at AS time
          FROM collections WHERE is_public = 1)
      UNION
      (SELECT
          'volume_ratings' AS table_type,
          id AS id,
          created_at AS time
          FROM volume_ratings)
      UNION
      (SELECT
          'collection_ratings' AS table_type,
          id AS id,
          created_at AS time
          FROM collection_ratings)
      UNION
      (SELECT
          'comments' AS table_type,
          id AS id,
          created_at AS time
          FROM comments WHERE number_of_marks IS NULL OR number_of_marks = 0)
          ) result
          ORDER BY time DESC;"
    # call get_log_activity(sql_stmt) to ececute sql stmt and returns array of activity records
   get_log_activity(sql_stmt)
  end
  
end
