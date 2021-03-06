# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  id_per_days   :integer          not null
#  target        :date             not null
#  name          :string           not null
#  priority      :integer
#  category_id   :integer
#  estimate_hour :float
#  started_at    :datetime
#  finished_at   :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Task, type: :model do
  describe 'メンバー定義' do
    it { is_expected.to respond_to(:id) }
    it { is_expected.to respond_to(:id_per_days) }
    it { is_expected.to respond_to(:target) }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:priority) }
    it { is_expected.to respond_to(:category_id) }
    it { is_expected.to respond_to(:estimate_hour) }
    it { is_expected.to respond_to(:started_at) }
    it { is_expected.to respond_to(:finished_at) }
    it { is_expected.to respond_to(:created_at) }
    it { is_expected.to respond_to(:updated_at) }
  end

  describe 'アソシエーション' do
    it { is_expected.to belong_to(:category) }
  end

  describe 'スコープ' do
    it 'デフォルトの並び順が id_per_days の昇順であること' do
      expect(Task.all.to_sql).to eq Task.unscoped.order(:id_per_days).to_sql
    end
  end
end
