require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  subject { response }

  describe 'GET #index' do
    before { get :index }
    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template(:index) }
  end

  describe 'GET #set_id' do
    context '有効なカテゴリーIDを指定された場合' do
      let!(:category) { FactoryGirl.create(:category, number: 1, name: 'Category', color: '#000000') }
      before { xhr :get, :set_id, id: category.id }
      it { is_expected.to have_http_status(:ok) }
      it { expect(assigns(:category)).to eq(category) }
    end

    context '無効なカテゴリーIDを指定された場合' do
      before { xhr :get, :set_id, id: 1 }
      it { is_expected.to have_http_status(:ok) }
    end
  end
end
