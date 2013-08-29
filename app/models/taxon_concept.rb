class TaxonConcept < EOLBase
  establish_connection("eol")
  
  attr_accessible :id, :name, :image
  
  def self.get_name(id)
    tc = self.find_by_sql("select names.string as name from names 
                        inner join taxon_concept_names tcn 
                          on tcn.name_id=names.id and taxon_concept_id=#{id}
                        where preferred=1")
    return tc.first.name
  end
  
  def self.get_image(id)
    
  end
end
