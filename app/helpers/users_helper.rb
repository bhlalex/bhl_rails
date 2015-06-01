module UsersHelper
  include ApplicationHelper
  def logged_in?
    session[:user_id].nil? ? false : true
  end
   # parse query for displaying
  def parse_query(query_string)
    parsed_query=''
    sub_queries = query_string.split("&")
    if sub_queries.nil?
      parsed_query
    else
      sub_queries.each do |sub_query|
        terms = sub_query.split("=")
        if terms[1] != nil
          parsed_query += "<b>#{I18n.t(terms[0][1,terms[0].length])}</b>: #{terms[1].tr("_", "")}<br/>"
        end
      end
      parsed_query = parsed_query[0,parsed_query.length-6]
    end
  end
  
  def get_number_of_returned_books(query_string)
    url_params = {}
    sub_queries = query_string.split("&")
    if sub_queries.any?
      sub_queries.each do |sub_query|
        terms = sub_query.split("=")
        url_params [terms[0].to_sym] = terms[1]
      end
    end
    query_array = {'ALL' => [], 'title'=> [], 'language'=> [], 'published_at'=> [], 'geo_location'=> [],
      'author'=> [], 'name'=> [], 'subject'=> [], 'content'=> [], 'date'=> []}
    query_array = set_query_array(query_array, url_params)
    query = set_query_string(query_array, false)
    solr = RSolr.connect :url => SOLR_BOOKS_METADATA
    search =  solr.find :q => query, :fl => "vol_jobid"
    search['response']['numFound']
  end
  
end