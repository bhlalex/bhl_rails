class Hierarchy < EOLBase
  establish_connection("eol")
  
  attr_accessible :id, :label, :browsable
end
