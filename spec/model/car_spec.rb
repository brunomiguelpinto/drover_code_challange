require 'rails_helper'

RSpec.describe Car, type: :model do
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:color) }
  it { should validate_presence_of(:availability_date) }
end
