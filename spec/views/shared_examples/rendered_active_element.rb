RSpec.shared_examples 'rendered active element' do
  it 'has a label' do
    render render_params
    expect(rendered).to include '<label for="group_field_name">Field name</label>'
  end

  context 'when it is required' do
    before(:each) { attributes[:required] = true }

    it "has an 'invalid' class attribute" do
      field.valid?
      render render_params
      expect(rendered).to match /<div.*class="invalid"/
    end

    it "has an asterisk in a label" do
      render render_params
      expect(rendered).to include '<label for="group_field_name">Field name*</label>'
    end

    it "has an error message" do
      field.valid?
      render render_params
      expect(rendered).to include '<span class="error">This field is required</span>'
    end
  end

    # As a class is gonna be in the wrapper
  it 'does not have an input with a class attribute' do
    attributes[:class] = 'my_class'
    render render_params
    expect(rendered).not_to match /<input.*class="my_class"/
  end
end