# Load the rails application
require File.expand_path('../application', __FILE__)

PROXY_ADDRESS = ""
PROXY_PORT = ""
PROXY_USERNAME = ""
PROXY_PASSWORD = ""
 
DAR_API_METADATA = ''
DAR_API_METADATA_BIBID_STRING = '[BIBID]'
DOWNLOAD_QUERY_SIZE = 100
 
DAR_API_THUMBNAIL = ''
DAR_API_THUMBNAIL_JOBID_STRING = '[JOBID]'
 
DAR_API_CONTENT = ''
DAR_API_CONTENT_JOBID_STRING = '[JOBID]'

DAR_JAR_API_URL = 'http://localhost:8090/BookViewer/?locale=en&LocaleButtons=disabled&book_id=DAF-Job:[JOBID]'
DAR_JAR_API_URL_STRING = '[JOBID]'

LOCATION_API = "http://maps.googleapis.com/maps/api/geocode/xml?address=[LOC]&sensor=false"
LOCATION_API_LOC_STRING = "[LOC]"
 
SOLR_BOOKS_METADATA = 'http://localhost:8988/solr/books_metadata'
SOLR_COMMIT_EVERY_COUNT = 20
 
EOL_NAMES_FINDER = 'http://eol.org/api/search/1.0.xml?q=[NAME_STRING]&page=1&exact=true'
EOL_NAMES_FINDER_STRING = '[NAME_STRING]'
 
EOL_PAGES_API = 'http://eol.org/api/pages/1.0/[NAME_ID].xml?images=1&videos=0&text=0'
EOL_PAGES_API_STRING = '[NAME_ID]'
 
EOL_DO_API = 'http://eol.org/api/data_objects/1.0/[DOID].xml?cache_ttl='
EOL_DO_API_STRING = '[DOID]'
 
THUMBS_PER_FOLDER = 1000
THUMB_MAX_WIDTH = 100
THUMB_MAX_HEIGHT = 100
 
NAME_SPOTTER_IP = '127.0.0.1'
NAME_SPOTTER_PORT = 8089
 
MAX_NAMES_PER_BOOK = 5

TAGGED_SPECIES_COUNT = 4
TAGGED_LANGUAGES_COUNT = 4
TAGGED_AUTHORS_COUNT = 4
TAGGED_AFFILIATION_COUNT = 4
TAGGED_GENRE_COUNT = 4

AUTOCOMPLETE_MAX = 4
LIMIT_USER_VIEWS_BOOKS = 5

PAGE_SIZE = 10

HLPRE = '<span class="highlight">'
HLPOST = '</span>'
DEFAULT_HIERARCHY_ID = 3
 
EOL_CONTENT_PATH = "http://content60.eol.org/content/"
 
CARTOGRAPHER_GMAP_VERSION = 3
 
NO_REPLY_EMAIL_ADDRESS = "no-reply@email.com"

DAR_VIEWER = "http://localhost:8090/BookViewer/?locale=[LANGUAGE]&MyBasket=Disabled&LocaleButtons=disabled&book_id=DAF-Job:[JOBID]"
DAR_VIEWER_REPLACE_STRING = "[JOBID]"
DAR_VIEWER_REPLACE_LANGUAGE = "[LANGUAGE]"

MAX_NO_ABUSE = 1
CONTACT_US_EMAIL= "walaa.gomaa.elsayed@gmail.com"


# Initialize the rails application
Bhl::Application.initialize!
 
Recaptcha.configure do |config|
  config.public_key  = ''
  config.private_key = ''
  #config.proxy = ''
end
