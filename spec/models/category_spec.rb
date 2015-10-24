# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  color      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'メンバー定義' do
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:number) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:color) }
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:updated_at) }
  end

  describe 'アソシエーション' do
    it { is_expected.to have_many(:tasks) }
  end

  describe 'スコープ' do
    it 'デフォルトの並び順が number の昇順であること' do
      expect(Category.all.to_sql).to eq Category.unscoped.order(:number).to_sql
    end
  end
end
