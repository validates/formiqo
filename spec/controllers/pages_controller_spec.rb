require 'rails_helper'

RSpec.describe PagesController, type: :controller do
  #  render_views
  let(:user1) { FactoryGirl.create(:user) }
  describe "GET index" do
    context "when user is a guest" do
      it "renders index page with" do
        get :index
        expect(response).to render_template(:index)
        # expect(response.body).to have_content("Get Started")
      end
    end

    context "when user is signed in" do
      before (:each) do
        @request.env["devise.mapping"] = Devise.mappings[:user]
        sign_in user1
      end

      it "redirects to mailboxes page" do
        get :index
        expect(response).to redirect_to(mailboxes_path)
      end
    end
  end
end
