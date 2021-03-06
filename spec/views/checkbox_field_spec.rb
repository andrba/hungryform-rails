require 'spec_helper'

describe 'rendering checkbox field' do
  let(:attributes) { {} }
  let(:resolver) { HungryForm::Resolver.new }
  let(:group) { HungryForm::Elements::Group.new(:group, nil, resolver, visible: true) {} }
  let(:field) { HungryForm::Elements::CheckboxField.new(:field_name, group, resolver, attributes) }
  let(:render_params) {
    {
      partial: 'hungryform/checkbox_field',
      locals: { field: field }
    }
  }

  it_behaves_like 'it is wrapped in a div'
  it_behaves_like 'rendered active element'

  it 'has an input' do
    render render_params
    expect(rendered).to match /<input(?=.*id="group_field_name")(?=.*type="checkbox")/
  end

  it 'is checked' do
    attributes[:value] = 1
    render render_params
    expect(rendered).to match /<input.*checked="checked"/
  end
end