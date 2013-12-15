class LogActivitiesController < ApplicationController
  include LogActivitiesHelper
  
  def index
    # sql_stmt : to select all users activities including creating new collection,
    # rating book or collection 
    # and also commented on book or collection ordered by creation time
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
          FROM collections WHERE status = 1)
      UNION
      (SELECT
          'book_ratings' AS table_type,
          id AS id,
          created_at AS time
          FROM book_ratings)
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
    @log_records = get_log_activity(sql_stmt)
    # applying pagination on log_records array
    @page = params[:page] ? params[:page].to_i : 1
    @lastPage = @log_records.count ? ((@log_records.count).to_f/PAGE_SIZE).ceil : 0
    limit = PAGE_SIZE
    offset = (@page > 1) ? (@page - 1) * limit : 0 
    @log_records = @log_records[offset,offset+limit]
    @url_params = params.clone
  end

end
