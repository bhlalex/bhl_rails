class TaxonConcept < EOLBase
  establish_connection("eol")
  
  attr_accessible :id, :name, :image
  
  def self.find_taxon_for_name(clean_name)    
    # first we need to get name_id
    name_id = self.get_name_id_from_clean_name(clean_name)
    
    return nil if name_id.nil?

    # next step is to get taxon_concept_id associated with this name
    tc = self.find_by_sql("select taxon_concept_id from taxon_concept_names where name_id=#{name_id} order by preferred desc limit 1;")

    return nil if tc.count <= 0

    taxon_concept_id = tc.first.taxon_concept_id

    return taxon_concept_id
  end

  def self.get_name_id_from_clean_name(clean_name)
    names = self.find_by_sql("select id from names where string='#{clean_name}' or clean_name='#{clean_name}' limit 1;")
    return nil if names.count <= 0

    # now we found a name
    name_id = names.first.id
    return name_id
  end

  def self.get_name(id)
    tc = self.find_by_sql("select names.string as name from names 
                            inner join taxon_concept_names tcn 
                              on tcn.name_id=names.id and taxon_concept_id=#{id} and  preferred=1 and language_id=0
                            limit 1")
    tc.count >= 1 ? tc.first.name : ""
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
                              where (data_subtype_id is null or data_subtype_id<>10)
                             order by view_order limit 1")
      if tc.count >= 1
        return tc.first.image
      else
        return nil
      end
    end
  end
end
