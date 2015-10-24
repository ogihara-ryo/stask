require 'rails_helper'

describe ApplicationHelper do
  describe '#page_title' do
    context 'ページタイトルを渡された場合' do
      it '[ページタイトル | アプリケーション名] を返すこと' do
        expect(page_title('page_title')).to eq("page_title | #{Stask::Application.config.title}")
      end
    end

    context 'ページタイトルを渡されなかった場合' do
      it 'ページタイトルがなければ、アプリケーション名のみを返すこと' do
        expect(page_title('')).to eq(Stask::Application.config.title)
      end
    end
  end
end
