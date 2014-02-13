require 'spec_helper'

describe 'baby form' do
  it 'uses the form_for helper' do
    baby_form_template = File.read(File.join(Rails.root, 'app', 'views', 'babies', '_form.html.erb'))

    expect(baby_form_template).to match(/form_for/)
  end
end

feature 'babbies' do
  context 'submitting a form for a new baby' do
    it 'generates correctly structured params' do
      visit new_baby_path

      fill_in('baby[first_name]', with: 'Junior')
      fill_in('baby[last_name]', with: 'Jeewillikers')
      fill_in('baby[weight]', with: 12)
      fill_in('baby[birth_date]', with: '2014-02-12')

      click_button 'Create Baby'

      expected_params = {
        'utf8' => '✓',
        'baby' => {
          'first_name' => 'Junior',
          'last_name'  => 'Jeewillikers',
          'weight'     => '12',
          'birth_date' => '2014-02-12'
        },
        'commit'     =>'Create Baby',
        'action'     =>'create',
        'controller' =>'babies'
      }

      expect(expected_params).to eq $params
    end
  end

  context 'submitting a form for an existing baby' do
    it 'generates correctly structured params' do
      baby = Baby.create({
        first_name: 'Cupcake',
        last_name: 'Jenkins',
        weight: 12,
        birth_date: Time.new(2014, 2, 14)
      })

      visit edit_baby_path(baby)

      click_button 'Update Baby'

      expected_params = {
        'utf8' => '✓',
        'baby' => {
          'first_name' => 'Cupcake',
          'last_name'  => 'Jenkins',
          'weight'     => '12',
          'birth_date' => '2-14-2014'
        },
        'commit'     =>'Create Baby',
        'action'     =>'create',
        'controller' =>'babies'
      }

      expect(expected_params).to eq $params
    end
  end
end
