require 'spec_helper'

describe Hierarchy do
  it 'Should get browsable hierarchies' do
    hierarchies = Hierarchy.find_all_by_browsable(1)
    hierarchies.count.should be > 0
  end
end
