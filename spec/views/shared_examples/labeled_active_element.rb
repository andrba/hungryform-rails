RSpec.shared_examples 'labeled active element' do
  it 'has a label' do
    render render_params
    expect(rendered).to include '<label for="group_field_name">Field name</label>'
  end

  context 'when it is required' do
    before(:each) { attributes[:required] = true }

    it "has an asterisk" do
      render render_params
      expect(rendered).to include '<label for="group_field_name">Field name*</label>'
    end
  end
end