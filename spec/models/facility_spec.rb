require 'rails_helper'

RSpec.describe Facility, type: :model do
  subject { build(:facility) }

  context 'validations' do
    it 'has a valid factory' do
      expect(build(:facility)).to be_valid
    end

    it { expect(subject).to validate_presence_of(:name) }

    it 'is not valid with a name shorter than 3 characters' do
      subject.name = "h"
      expect(subject).to_not be_valid
    end

    it 'is not valid with a name longer than 55 characters' do
      subject.name = "hkjthdrjkghskdruhtdkujfhgkdjfhgkjxfhguhgkjxfhuhfkjbhgkuhckgjbhufhgkjhbjucfhkubchfgucfhjughxfugyudfkghkuxftytiuythguyxiu"
      expect(subject).to_not be_valid
    end
  end

  context 'associations' do
    it { expect(subject).to have_many(:trails).through(:facility_trails) }
  end
end


