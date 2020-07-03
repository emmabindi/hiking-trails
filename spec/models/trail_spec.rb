require 'rails_helper'

RSpec.describe Trail, type: :model do
  subject { build(:trail) }

  context 'validations' do
    it 'has a valid factory' do
      expect(build(:trail)).to be_valid
    end

    it { expect(subject).to validate_presence_of(:name)}

    # # it { expect(subject).to validate_length_of(:name).less_than(75)}
    # it { should validate_length_of(:name).is_at_most(75) }

    it 'is not valid with a name longer than 75 characters' do
      subject.name = "jfhghdurhgdkuhgkxfdhgkxjfdhgkjxfhgjkxhfgjkhxfgkjdkfjghkjxfhgkxjfhgkxjhgkjxhfgkjxhfgkjxhfdgkjhxfdkghxkfjghkxjfhkhdfkxjhfdg"
      expect(subject).to_not be_valid
    end

    it 'is not valid with a name shorter than 8 characters' do
      subject.name = "short"
      expect(subject).to_not be_valid
    end

    it {expect(subject).to validate_numericality_of(:distance).is_greater_than(0)}


    it { expect(subject).to validate_numericality_of(:difficulty).is_greater_than_or_equal_to(1).is_less_than_or_equal_to(5)}


    it 'it is valid with a location' do
      subject.location = "Macedon Ranges"
      expect(subject).to be_valid
    end
  end 

  context 'associations' do
    it { expect(subject).to have_many(:facilities).through(:facility_trails) }
    it { expect(subject).to belong_to(:user)}
  end
end



  # The Old method before Factory builder: 
  # subject { described_class.new(
  #   name: 'Test Trail',
  #   distance: 100,
  #   difficulty: 3
  # )}

      # VERBOSE WAY:
    # it 'is not valid with a difficulty greater than 5' do
    #   subject.difficulty = 6
    #   expect(subject).to_not be_valid
    # end

    # VERBOSE WAY:
    # it 'is not valid with a distance of 0' do
    #   subject.distance = 0
    #   expect(subject).to_not be_valid
    # end    
    # it 'is not valid with a distance of less than 0' do
    #   subject.distance = -10
    #   expect(subject).to_not be_valid
    # end

    # Another new school test for name:
    # it { should validate_presence_of(:name)}

    # Not relevant with the factory:
    # it 'is valid with valid attributes' do
    #   expect(subject).to be_valid
    # end


    # Old School test for name: 
    # it 'is not valid without a name' do 
    #   subject.name = nil
    #   expect(subject).to_not be_valid
    # end