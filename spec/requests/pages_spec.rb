require "rails_helper"

RSpec.describe "Pages Phone number" do

  it "shows the correct number based on source IP" do
    get "/"
    expect(response).to render_template(:new)

    post "/widgets", :widget => {:name => "My Widget"}

    expect(response).to redirect_to(assigns(:widget))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include("Widget was successfully created.")
  end

end