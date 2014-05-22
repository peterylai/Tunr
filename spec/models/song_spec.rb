require 'spec_helper'

describe Song do
  it { should belong_to(:artist) }  
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:artist) }
  it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0)}
end