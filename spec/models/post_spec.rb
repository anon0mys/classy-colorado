require 'rails_helper'

RSpec.describe Post do
  describe 'validations' do
    it { should validate_presence_of :title }
    it { should validate_presence_of :body }
  end

  describe 'relationships' do
    it { should belong_to :author }
  end
end
