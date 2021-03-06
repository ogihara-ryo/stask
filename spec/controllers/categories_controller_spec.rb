require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do
  subject { response }

  describe 'GET #index' do
    before { get :index }
    it { is_expected.to have_http_status(:ok) }
    it { is_expected.to render_template(:index) }
  end

  describe 'POST #create' do
    context '存在しない ID を指定された場合' do
      it 'Category に新しいレコードが登録されること' do
        expect {
          xhr :post, :create, category: FactoryGirl.attributes_for(:category)
        }.to change(Category, :count).by(1)
      end
    end

    context '存在する ID を指定された場合' do
      it '既存のレコードが更新されること' do
        category = FactoryGirl.create(:category)
        xhr :post, :create, category: { id: category.id, number: 2, name: 'test', color: '#ffffff' }
        category.reload
        expect(category.number).to eq 2
        expect(category.name).to eq 'test'
        expect(category.color).to eq '#ffffff'
      end
    end

    context '不正なパラメーターを指定された場合' do
      it 'データベースへの反映が行われないこと' do
        category = FactoryGirl.create(:category)
        xhr :post, :create, category: { id: category.id, color: '#' }
        category.reload
        expect(category.color).not_to eq '#'
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'Category のレコードが1つ減ること' do
      category = FactoryGirl.create(:category)
      expect {
        xhr :delete, :destroy, id: category.id
      }.to change(Category, :count).by(-1)
    end
  end

  describe 'GET #set_form' do
    context '有効なカテゴリーIDを指定された場合' do
      let!(:category) { FactoryGirl.create(:category, number: 1, name: 'Category', color: '#000000') }
      before { xhr :get, :set_form, id: category.id }
      it { is_expected.to have_http_status(:ok) }
      it { expect(assigns(:category)).to eq(category) }
    end

    context '無効なカテゴリーIDを指定された場合' do
      before { xhr :get, :set_form, id: 1 }
      it { is_expected.to have_http_status(:ok) }
    end
  end
end
