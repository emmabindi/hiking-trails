require 'rails_helper'

RSpec.describe FacilityTrail, type: :model do
  context 'validations' do
    it 'has a valid factory' do 
      expect(build(:facility_trail)).to be_valid
    end

    context 'associations' do 
      it { expect(subject).to belong_to(:trail)}
      it { expect(subject).to belong_to(:facility)}
    end
  end
  # Old school way to write
  # it 'belongs to a Trail' do
  #   relation = FacilityTrail.reflect_on_association(:trail)
  #   expect(relation.macro).to eql(:belongs_to)
  # end

  # New school
  it { should belong_to(:trail)}
end
