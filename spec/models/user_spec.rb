require 'spec_helper'

describe User do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_numericality_of(:balance).is_greater_than_or_equal_to(0)}
end