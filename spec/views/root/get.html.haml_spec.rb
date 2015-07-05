require 'rails_helper'

RSpec.describe "root/get", :type => :view do

  context "austin" do
    before do
      @austin_ip = create(:austin_ip)
      san_antonio_ip = create(:san_antonio_ip)
      allow_any_instance_of(ActionDispatch::Request).to receive(:remote_ip).and_return(@austin_ip)
    end

    it 'should show the correct ip' do
      render_views
      expect(rendered).to match(/@austin_ip/)
    end
  end

end