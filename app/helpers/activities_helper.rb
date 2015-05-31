module ActivitiesHelper
  def get_log_activity(sql_stmt)
    log_activities = LogActivities.find_by_sql(sql_stmt)
    log_records = [] # to hold different log records
    log_record = nil
    if (!(log_activities.nil?))
      log_activities.each do |activity|
        if(activity[:table_type] == "collection")
          collection = Collection.find(activity[:id])
          # log record of each created collection contains user name and collection name
          log_record = "<p><a class='author' href = '/users/#{collection.user_id}'>#{User.find(collection.user_id).real_name}</a> #{I18n.t(:log_activity_create)} <a class= 'book_title' href = '/collections/#{collection.id}'>#{collection.title}</a></p><small class='text-muted'> #{ I18n.t(:log_activity_at)} #{activity[:time]}</small>"
          log = {:user => collection.user_id, :action => I18n.t(:log_activity_create), :object_link => "/collections/#{collection.id}", :object_name => collection.title, :text => "", :time => activity[:time]}
        elsif(activity[:table_type] == "volume_ratings")
          volume_rating = VolumeRating.find(activity[:id])
          # log record of each rated book contains user name , book name and rate vaule
          log_record = "<p><a class='author' href = '/users/#{volume_rating.user_id}'>#{User.find(volume_rating.user_id).real_name}</a> #{I18n.t(:log_activity_rate)} <a class= 'book_title' href = '/books/#{(Volume.find(volume_rating.volume_id)).job_id}'> #{Volume.find(volume_rating.volume_id).book.title}</a> #{I18n.t(:log_activity_with)} #{volume_rating.rate}</p><small class='text-muted'> #{ I18n.t(:log_activity_at)} #{activity[:time]}</small>"
          log = {:user => volume_rating.user_id, :action => I18n.t(:log_activity_rate), :object_link => "/books/#{(Volume.find(volume_rating.volume_id)).job_id}", :object_name => Volume.find(volume_rating.volume_id).book.title, :text => "#{I18n.t(:log_activity_with)} #{volume_rating.rate}", :time => activity[:time]}
        elsif(activity[:table_type] == "collection_ratings")
          collection_rating = CollectionRating.find(activity[:id])
          if Collection.exists?(:id => collection_rating.collection_id)
          # log record of each rated collection contains user name , collection name and rate vaule
            log_record = "<p><a class='author' href = '/users/#{collection_rating.user_id}'>#{User.find(collection_rating.user_id).real_name}</a> #{I18n.t(:log_activity_rate)} <a class= 'book_title' href = '/collections/#{collection_rating.collection_id}'>#{Collection.find(collection_rating.collection_id).title}</a> #{I18n.t(:log_activity_with)} #{collection_rating.rate}</p><small class='text-muted'>  #{ I18n.t(:log_activity_at)} #{activity[:time]}</small>"
            log = {:user => collection_rating.user_id, :action => I18n.t(:log_activity_rate), :object_link => "/collections/#{collection_rating.collection_id}", :object_name => Collection.find(collection_rating.collection_id).title, :text => "#{I18n.t(:log_activity_with)} #{collection_rating.rate}", :time => activity[:time]}
          end
        elsif(activity[:table_type] == "comments")
          comment = Comment.find(activity[:id])
          # log record of each comment on a book contains user name , book name and comment text
          log_record = "<p><a class='author' href = '/users/#{comment.user_id}'>#{User.find(comment.user_id).real_name}</a> #{I18n.t(:log_activity_comment)}  <a class= 'book_title' href = '/books/#{(Volume.find(comment.volume_id)).job_id}'>#{Volume.find(comment.volume_id).book.title}</a>: <br/>#{comment.text}</p><small class='text-muted'>  #{ I18n.t(:log_activity_at)} #{activity[:time]}</small>" if !(comment.volume_id.nil?)
          # log record of each comment on a collection contains user name , collection name and comment text
          log_record = "<p><a class='author' href = '/users/#{comment.user_id}'>#{User.find(comment.user_id).real_name}</a> #{I18n.t(:log_activity_comment)}  <a class= 'book_title' href = '/collections/#{comment.collection_id}'>#{Collection.find(comment.collection_id).title}</a>:  <br/>#{comment.text}</p><small class='text-muted'>  #{ I18n.t(:log_activity_at)} #{activity[:time]}</small>" if !(comment.collection_id.nil?) && Collection.exists?(:id => comment.collection_id)
          # log record of each reply on a comment contains user name , base comment text and reply text
          log_record = "<p><a class='author' href = '/users/#{comment.user_id}'>#{User.find(comment.user_id).real_name}</a> #{I18n.t(:log_activity_comment)} #{Comment.find(comment.comment_id).text}:  <br/>#{comment.text} </p><small class='text-muted'> #{ I18n.t(:log_activity_at)} #{activity[:time]}</small>" if !(comment.comment_id.nil?)
          log = {:user => comment.user_id, :action => I18n.t(:log_activity_comment), :object_link => "/books/#{(Volume.find(comment.volume_id)).job_id}", :object_name => Volume.find(comment.volume_id).book.title, :text => comment.text, :time => activity[:time]} if !(comment.volume_id.nil?)
          log = {:user => comment.user_id, :action => I18n.t(:log_activity_comment), :object_link => "/collections/#{comment.collection_id}", :object_name => Collection.find(comment.collection_id).title, :text => comment.text, :time => activity[:time]} if !(comment.collection_id.nil?)  && Collection.exists?(:id => comment.collection_id)
          log = {:user => comment.user_id, :action => I18n.t(:log_activity_comment), :object_link => "", :object_name => Comment.find(comment.comment_id).text, :text => comment.text, :time => activity[:time]} if !(comment.comment_id.nil?)

          end
        log_records << log
      end
    end
    log_records
  end
  def get_activities_count(filter)
    case filter 
    when "comments"
      stmt = "SELECT SUM(result.count) AS count
                FROM(
                (SELECT count(*) AS count
                FROM comments WHERE number_of_marks IS NULL OR number_of_marks = 0)
                ) result;"
    when "rate"
      stmt = "SELECT SUM(result.count) AS count
                FROM((SELECT count(*) AS count
                FROM volume_ratings)
                UNION
                (SELECT count(*) AS count
                FROM collection_ratings)
                ) result;"
    when "collections"
      stmt = "SELECT SUM(result.count) AS count
                FROM((SELECT count(*) AS count
                FROM collections)
                ) result;"
    else
      stmt = "SELECT SUM(result.count) AS count
                FROM((SELECT count(*) AS count
                FROM collections)
                UNION
                (SELECT count(*) AS count
                FROM volume_ratings)
                UNION
                (SELECT count(*) AS count
                FROM collection_ratings)
                UNION
                (SELECT count(*) AS count
                FROM comments WHERE number_of_marks IS NULL OR number_of_marks = 0)
                ) result;"  
    end
    LogActivities.find_by_sql(stmt)
  end
  def get_activities(filter, sort, offset, limit)
    case filter 
    when "comments"
      stmt = "SELECT
            result.table_type AS table_type,
            result.id AS id,
            result.time AS time
            FROM
            ((SELECT
                'comments' AS table_type,
                id AS id,
                created_at AS time
                FROM comments WHERE number_of_marks IS NULL OR number_of_marks = 0)
                ) result
                ORDER BY time #{sort} LIMIT #{offset}, #{limit};"  
    when "rate"
      stmt = "SELECT
            result.table_type AS table_type,
            result.id AS id,
            result.time AS time
            FROM
            ((SELECT
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
                ) result
                ORDER BY time #{sort} LIMIT #{offset}, #{limit};"
    when "collections"
      stmt = "SELECT
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
                  ) result
                  ORDER BY time #{sort} LIMIT #{offset}, #{limit};"  
    else
      stmt = "SELECT
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
          ORDER BY time #{sort} LIMIT #{offset}, #{limit};"  
    end
    get_log_activity(stmt)
  end
end
