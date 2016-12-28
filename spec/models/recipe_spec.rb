require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
  end
  context "relationships" do
    it { should belong_to(:user) }
    it { should have_many(:ingredients) }
    it { should have_many(:directions) }
  end
end
