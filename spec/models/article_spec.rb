require 'rails_helper'
require 'spec_helper'

RSpec.describe Article, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :body }
    it { is_expected.to have_db_column :author }
    it { is_expected.to have_db_column :created_at }
	end 

  describe 'Validations' do
    it { is_expected.to validate_presence_of :title }
    it { is_expected.to validate_presence_of :body }
    it { is_expected.to validate_presence_of :author }
  end

  describe 'Factory' do
    it 'should have valid Factory' do
      expect(FactoryBot.create(:article)).to be_valid
    end
  end

  describe 'GET api/v0/articles' do
    it 'returns a list of articles' do
      get '/api/v0/articles'
      expect(Article.count).to eq 6
    end
  end

end