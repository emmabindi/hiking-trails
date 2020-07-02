require 'rails_helper'

RSpec.describe Trail, type: :model do
  subject { described_class.new(
    name: 'Test Trail',
    distance: 100,
    difficulty: 3
  )}

  context 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do 
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid with a difficulty greater than 5' do
      subject.difficulty = 6
      expect(subject).to_not be_valid
    end
  end 
end
