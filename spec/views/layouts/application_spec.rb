require 'rails_helper'

describe 'layouts/application.html.slim' do
  it '各種パーシャルがレンダリングされること' do
    view.lookup_context.prefixes = 'application'
    render
    expect(rendered).to render_template('_head')
    expect(rendered).to render_template('_header')
  end
end
