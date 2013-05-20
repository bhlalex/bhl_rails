# Load the rails application
require File.expand_path('../application', __FILE__)

DAR_API_METADATA = 'http://api.dar.bibalex.org/DarAccessLayer/[BIBID]/getStream/descMetadata'
DOWNLOAD_QUERY_SIZE = 100


# Initialize the rails application
Bhl::Application.initialize!

