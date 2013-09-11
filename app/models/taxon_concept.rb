class TaxonConcept < EOLBase
  establish_connection("eol")
  
  attr_accessible :id, :name, :image
  
  def self.get_name(id)
    tc = self.find_by_sql("select names.string as name from names 
                            inner join taxon_concept_names tcn 
                              on tcn.name_id=names.id and taxon_concept_id=#{id} and  preferred=1 and language_id=0
                            limit 1")
    return tc.first.name
  end
  
  def self.get_image(id)
    # first try to get exampler image
    tc = self.find_by_sql("select object_cache_url as image from taxon_concept_exemplar_images tcei 
                            inner join data_objects do on do.id=tcei.data_object_id and tcei.taxon_concept_id=#{id} 
                           limit 1")
    if tc.count >= 1
      return tc.first.image
    else
      tc = self.find_by_sql("select object_cache_url as image from top_concept_images tci 
                              inner join data_objects do on do.id=tci.data_object_id and tci.taxon_concept_id=#{id} 
                             order by view_order limit 1")
      if tc.count >= 1
        return tc.first.image
      else
        return nil
      end
    end
  end
end
