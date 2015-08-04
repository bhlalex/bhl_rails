class PagesController < ApplicationController
  include SolrHelper
  include BooksHelper
  include ActivitiesHelper
  layout 'pages'
 
  def about
  end

  # provide users with form to send email to site master
  def contact
    @email_message = EmailMessage.new
    @verify_captcha = true
  end

  # send_message: to send email message to site master
  # using enterd name, email, subject and message body entered by user
  # also store email message paramters in email_messages table
  def send_message
    @email_message = EmailMessage.new(params[:email_message])
    if @email_message.valid?
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

  def top_rated_books
   prepare_top_rated_books_part
   respond_to do |format|  
     format.html { render :partial => 'pages/top_rated_books' }
   end
  end

  def home
    prepare_statistics_part    
    prepare_top_collections_part    
    prepare_most_viewed_books_part    
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
  def prepare_statistics_part
    @bhl_statistics = Rails.cache.fetch("bhl_statistics", expires_in: 1.day) do
      bhl_statistic = BhlStatistic.last
      if bhl_statistic
        { books: bhl_statistic.books_count, authors: bhl_statistic.authors_count, names: bhl_statistic.species_count }
      else
        { books: 0, authors: 0, names: 0 }
      end
    end
  end
  
  def prepare_top_collections_part    
    @top_collections = Rails.cache.fetch("top_collections", expires_in: 1.day) do
      Collection.where(:is_public => true).order("rate desc").limit(TOP_COLLECTIONS_COUNT).offset(0)
    end
  end
  
  def prepare_most_viewed_books_part
    @most_viewed_response = Rails.cache.fetch("most_viewed_books", expires_in: 1.day) do 
      search_facet_highlight( "*:*", 1, MOST_VIEWED_BOOKS, "views desc")
    end
  end
  
  def prepare_top_rated_books_part
    @top_rated_response = Rails.cache.fetch("top_rated_books", expires_in: 1.day) do
      search_facet_highlight( "*:*", 1, MOST_VIEWED_BOOKS, "rate desc")
    end
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
