module LogActivitiesHelper
  
  # get_log_activity(sql_stmt): executes the sql_stmt paramter 
  # and then creating different log records (for viewing) according to the type of each activity
  def get_log_activity(sql_stmt)
    log_activities = LogActivities.find_by_sql(sql_stmt)
    log_records = [] # to hold different log records
    log_record = nil
    if (!(log_activities.nil?))
      log_activities.each do |activity|
        if(activity[:table_type] == "collection")
          collection = Collection.find(activity[:id])
            # log record of each created collection contains user name and collection name
          log_record = "<h3><a href = '/users/show/#{collection.user_id}'>#{User.find(collection.user_id).real_name}</a> #{I18n.t(:log_activity_create)} <a href = '/collections/list_books_in_collection/#{collection.id}'>#{collection.title}</a></h3>  <h5> #{activity[:time]}</h5>"
        elsif(activity[:table_type] == "book_ratings")
          book_rating = BookRating.find(activity[:id])
          # log record of each rated book contains user name , book name and rate vaule
          log_record = "<h3><a href = '/users/show/#{book_rating.user_id}'>#{User.find(book_rating.user_id).real_name}</a> #{I18n.t(:log_activity_rate)} <a href = '/books/#{(Volume.find(book_rating.volume_id)).job_id}'> #{Volume.find(book_rating.volume_id).book.title}</a> #{I18n.t(:log_activity_with)} #{book_rating.rate}</h3> <h5> #{activity[:time]}</h5>"
        elsif(activity[:table_type] == "collection_ratings")
          collection_rating = CollectionRating.find(activity[:id])
          # log record of each rated collection contains user name , collection name and rate vaule
          log_record = "<h3><a href = '/users/show/#{collection_rating.user_id}'>#{User.find(collection_rating.user_id).real_name}</a> #{I18n.t(:log_activity_rate)} <a href = '/collections/list_books_in_collection/#{collection_rating.collection_id}'>#{Collection.find(collection_rating.collection_id).title}</a> #{I18n.t(:log_activity_with)} #{collection_rating.rate}</h3> <h5> #{activity[:time]}</h5>"
        else
          comment = Comment.find(activity[:id])
          # log record of each comment on a book contains user name , book name and comment text
          log_record = "<h3><a href = '/users/show/#{comment.user_id}'>#{User.find(comment.user_id).real_name}</a> #{I18n.t(:log_activity_comment)}  <a href = '/books/#{(Volume.find(comment.volume_id)).job_id}'>#{Volume.find(comment.volume_id).book.title}</a>: #{comment.text}</h3> <h5> #{activity[:time]}</h5>" if !(comment.volume_id.nil?)
            # log record of each comment on a collection contains user name , collection name and comment text
          log_record = "<h3><a href = '/users/show/#{comment.user_id}'>#{User.find(comment.user_id).real_name}</a> #{I18n.t(:log_activity_comment)} <a href = '/collections/list_books_in_collection/#{comment.collection_id}'>#{Collection.find(comment.collection_id).title}</a>: #{comment.text}</h3> <h5> #{activity[:time]}</h5>" if !(comment.collection_id.nil?)
            # log record of each reply on a comment contains user name , base comment text and reply text
          log_record = "<h3><a href = '/users/show/#{comment.user_id}'>#{User.find(comment.user_id).real_name}</a> #{I18n.t(:log_activity_comment)} #{Comment.find(comment.comment_id).text}: #{comment.text}</h3> <h5> #{activity[:time]}</h5>" if !(comment.comment_id.nil?)
        end
        log_records << log_record
      end
    end
    log_records
  end
end
