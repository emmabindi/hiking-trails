require 'rails_helper'

RSpec.describe FacilityTrail, type: :model do
  # Old school way to write
  # it 'belongs to a Trail' do
  #   relation = FacilityTrail.reflect_on_association(:trail)
  #   expect(relation.macro).to eql(:belongs_to)
  # end

  # New school
  it { should belong_to(:trail)}
end
