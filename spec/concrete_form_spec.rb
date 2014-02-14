require 'spec_helper'

feature 'concrete form' do
  it 'uses the form_tag helper' do
    new_concrete_form_template  = File.read(File.join(Rails.root, 'app', 'views', 'concretes', 'new.html.erb'))
    expect(new_concrete_form_template).to match(/form_tag/)

    edit_concrete_form_template = File.read(File.join(Rails.root, 'app', 'views', 'concretes', 'edit.html.erb'))
    expect(edit_concrete_form_template).to match(/form_tag/)
  end

  context 'submitting a form for new concrete' do
    it 'generates correctly structured params' do
      visit new_concrete_path

      mix_type      = 'anchoring'
      color         = 'brown'
      psi           = '5800'
      cost_per_yard = '9800'

      fill_in('concrete[mix_type]', with: mix_type)
      fill_in('concrete[color]', with: color)
      fill_in('concrete[psi]', with: psi)
      fill_in('concrete[cost_per_yard]', with: cost_per_yard)

      click_button 'Create Concrete'

      expected_params = {
        'utf8' => '✓',
        'concrete' => {
          'mix_type'      => mix_type,
          'color'         => color,
          'psi'           => psi,
          'cost_per_yard' => cost_per_yard
        },
        'commit'     =>'Create Concrete',
        'action'     =>'create',
        'controller' =>'concretes',
        'authenticity_token' => 'test token'
      }

      expect(expected_params).to eq test_params
    end
  end

  context 'submitting a form for existing concrete' do
    it 'generates correctly structured params' do
      concrete = Concrete.create({
        mix_type: 'fiber reinforced',
        psi: 4000,
        color: 'Red',
        cost_per_yard: 9800
      })

      visit edit_concrete_path(concrete)

      click_button 'Update Concrete'

      expected_params = {
        'utf8'    => '✓',
        '_method' => 'patch',
        'concrete' => {
          'mix_type'      => concrete.mix_type,
          'psi'           => concrete.psi.to_s,
          'color'         => concrete.color,
          'cost_per_yard' => concrete.cost_per_yard.to_s
        },
        'commit'     =>'Update Concrete',
        'action'     =>'update',
        'controller' =>'concretes',
        'id'         => concrete.id.to_s,
        'authenticity_token' => 'test token'
      }

      expect(expected_params).to eq test_params
    end
  end
end
