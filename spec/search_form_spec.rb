require 'spec_helper'

describe 'search form' do
  it 'uses the <form> tag' do
    new_concrete_form_template  = File.read(File.join(Rails.root, 'app', 'views', 'searches', 'new.html.erb'))
    expect(new_concrete_form_template).to match(/<form[^>]*>/)
  end
end

feature 'search' do
  context 'submitting a search form' do
    it 'generates correctly structured params' do
      visit new_searches_path

      q = 'meaning'

      fill_in('q', with: q)
      click_button 'Search'

      expected_params = { 'q' => q }
      expect(expected_params).to eq $params
    end
  end
end
