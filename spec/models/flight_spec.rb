# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:source) }
    it { should validate_presence_of(:destination) }
    it { should validate_presence_of(:departure_time) }
    it { should validate_presence_of(:arrival_time) }
    it { should validate_presence_of(:price) }
    it { should validate_presence_of(:flight_number) }
  end

  describe 'associations' do
    it { should belong_to(:airline) }
  end
end
