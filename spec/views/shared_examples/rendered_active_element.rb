RSpec.shared_examples 'rendered active element' do
  context 'when it is required' do
    before(:each) { attributes[:required] = true }

    it "has an 'invalid' class attribute" do
      field.valid?
      render render_params
      expect(rendered).to match /<div.*class="invalid"/
    end

    it "has an error message" do
      field.valid?
      render render_params
      expect(rendered).to include '<span class="error">This field is required</span>'
    end
  end

  it 'has a wrapper class attribute in the div wrapper' do
    attributes[:wrapper_class] = 'my_class'
    render render_params
    expect(rendered).to match /<div.*class="my_class"/
  end
end