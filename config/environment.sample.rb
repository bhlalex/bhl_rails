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

DAR_JAR_API_URL = ''
DAR_JAR_API_URL_STRING = '[JOBID]'
DAR_JAR_API_URL_LANGUAGE = "[LANGUAGE]"

LOCATION_API = "http://maps.googleapis.com/maps/api/geocode/xml?address=[LOC]&sensor=false"
LOCATION_API_LOC_STRING = "[LOC]"
 
SOLR_BOOKS_METADATA = 'http://localhost:8988/solr/books_metadata'
SOLR_SCI_NAMES = 'http://localhost:8988/solr/sci_names'
SOLR_COMMIT_EVERY_COUNT = 20
 
EOL_NAMES_FINDER = 'http://eol.org/api/search/1.0.xml?q=[NAME_STRING]&page=1&exact=true'
EOL_NAMES_FINDER_STRING = '[NAME_STRING]'
 
EOL_PAGES_API = 'http://eol.org/api/pages/1.0/[NAME_ID].xml?images=1&videos=0&text=0'
EOL_PAGES_API_STRING = '[NAME_ID]'
 
EOL_DO_API = 'http://eol.org/api/data_objects/1.0/[DOID].xml?cache_ttl='
EOL_DO_API_STRING = '[DOID]'
 
THUMBS_PER_FOLDER = 1000
THUMB_MAX_WIDTH = 140
THUMB_MAX_HEIGHT = 160
 
NAME_SPOTTER_IP = '127.0.0.1'
NAME_SPOTTER_PORT = 8089
 
MAX_NAMES_PER_BOOK = 5

TAGGED_SPECIES_COUNT = 4
TAGGED_LANGUAGES_COUNT = 4
TAGGED_AUTHORS_COUNT = 4
TAGGED_AFFILIATION_COUNT = 4
TAGGED_GENRE_COUNT = 4

AUTOCOMPLETE_MAX = 4
LIMIT_CAROUSEL = 4
LIMIT_BOOK_COMMENTS = 4

PAGE_SIZE = 10
COLLECTION_PAGE_SIZE = 12

HLPRE = '<span class="highlight">'
HLPOST = '</span>'
DEFAULT_HIERARCHY_ID = 3
 
EOL_CONTENT_PATH = "http://content60.eol.org/content/"
 
CARTOGRAPHER_GMAP_VERSION = 3
 
NO_REPLY_EMAIL_ADDRESS = "bhl.team@bibalex.org"
CONTACT_US_EMAIL = "bhl.team@bibalex.org"
BHL_LINK =  "http://beta.bhl.bibalex.org"
HADOOP_FOLDER = "/SAN/Hadoop/"

MAX_NO_ABUSE = 1

COLLECTION_FOLDER = 'collections/'
UPLOADED_PHOTO_MAX_SIZE = 1

TOP_COLLECTIONS_COUNT = 5
MOST_VIEWED_BOOKS = 3
HOME_LOG_ACTIVITIES = 5
LOGIN_ATTEMPTS = 1
TAB_PAGE_SIZE = 8
TAB_GALLERY_PAGE_SIZE = 9
RESIZED_PHOTO_WIDTH = 140
RESIZED_PHOTO_HIGHT = 160
RESIZED_PHOTO_WIDTH_SMALL = 100
RESIZED_PHOTO_HIGHT_SMALL = 120
# Initialize the rails application

ATTACHMENTS_URL = "http://localhost:3000/"
THUMB_FOLDER = "thumbs/"

Bhl::Application.initialize!
 
Recaptcha.configure do |config|
  config.public_key  = ''
  config.private_key = ''
  #config.proxy = ''
end
