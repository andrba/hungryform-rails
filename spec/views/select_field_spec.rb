require 'spec_helper'

describe 'rendering a select field' do
  let(:attributes) { 
    {
      options: {
        'first' => 'First',
        'second' => 'Second'
      }
    } 
  }
  let(:resolver) { HungryForm::Resolver.new }
  let(:group) { HungryForm::Elements::Group.new(:group, nil, resolver, visible: true) {} }
  let(:field) { HungryForm::Elements::SelectField.new(:field_name, group, resolver, attributes) }
  let(:render_params) {
    {
      partial: 'hungryform/select_field',
      locals: { field: field }
    }
  }

  it_behaves_like 'it is wrapped in a div'
  it_behaves_like 'rendered active element'

  it 'has a select tag' do
    render render_params
    expect(rendered).to match /<select.*id="group_field_name"/
  end

  it 'has a selected value' do
    attributes[:value] = 'second'
    render render_params
    expect(rendered).to match /<option(?=.*selected="selected")(?=.*value="second")/
  end
end