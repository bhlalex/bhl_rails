require 'spec_helper'

describe HierarchyEntry do
  it 'Should get entries for the first hierarchy' do
    hierarchy = hierarchies = Hierarchy.find_all_by_browsable(1).first
    entries = HierarchyEntry.find_siblings(hierarchy.id, 0)
    entries.count.should > 0
  end
end
