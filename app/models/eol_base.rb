class EOLBase < ActiveRecord::Base
  self.abstract_class = true
  establish_connection("eol")
end