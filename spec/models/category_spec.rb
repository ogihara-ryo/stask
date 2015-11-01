# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  number     :integer          not null
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

  describe 'バリデーション' do
    it 'カラーコードのフォーマットは16進数で3桁、または6桁であること' do
      valid_colorcodes = %w(#123456 #abcdef #123abc #123 #abc #10f)
      invalid_colorcodes = %w(#1234567 #bcdefg # #1 #1234)
      is_expected.to allow_value(*valid_colorcodes).for(:color)
      is_expected.not_to allow_value(*invalid_colorcodes).for(:color)
    end
  end

  describe 'self.new_id' do
    context 'Category にレコードが登録されている場合' do
      it '次の ID を返すこと' do
        DatabaseCleaner.clean_with(:truncation)
        FactoryGirl.create(:category)
        expect(Category.new_id).to eq 2
      end
    end

    context 'Category にレコードが登録されていない場合' do
      it '1 を返すこと' do
        DatabaseCleaner.clean_with(:truncation)
        expect(Category.new_id).to eq 1
      end
    end
  end
end
