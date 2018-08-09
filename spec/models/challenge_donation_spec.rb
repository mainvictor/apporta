require 'rails_helper'

RSpec.describe ChallengeDonation, type: :model do
  # Association test
  # ensure an item record belongs to a single todo record
  it { should belong_to(:challenge) }
  
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:media) }
  it { should validate_presence_of(:description) }
  
end
