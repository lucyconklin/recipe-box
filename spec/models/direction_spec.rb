require 'rails_helper'

RSpec.describe Direction, type: :model do
  context "validations" do
    it { should validate_presence_of(:description) }
  end
  context "relationships" do
    it { should belong_to(:recipe) }
  end
end
