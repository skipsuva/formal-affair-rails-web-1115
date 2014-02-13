require 'spec_helper'

describe "baby form" do
  it "uses the form_for helper" do
    baby_form_template = File.read(File.join(Rails.root, 'app', 'views', 'babies', 'new.html.erb'))

    expect(baby_form_template).to match(/form_for/)
  end
end

feature "forming babbies" do
  it "submits correctly structured params" do
    visit new_baby_path

    fill_in('baby[first_name]', with: 'Junior')
    fill_in('baby[last_name]', with: 'Jeewillikers')
    fill_in('baby[weight]', with: 12)
    fill_in('baby[birth_date]', with: '2014-02-12')

    click_button 'Create Baby'

    expected_params = {
      "utf8" => "✓",
      "baby" => {
        "first_name" => "Junior",
        "last_name"  => "Jeewillikers",
        "weight"     => "12",
        "birth_date" => "2014-02-12"
      },
      "commit"     =>"Create Baby",
      "action"     =>"create",
      "controller" =>"babies"
    }

    expect(expected_params).to eq $params
  end
end
