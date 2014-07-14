require 'rails_helper'

RSpec.describe "Users", :type => :request do
  describe "GET /users" do
    it "works! (now write some real specs)" do
      get users_index_path
      expect(response.status).to be(200)
    end

end
end
describe "Users" do

	descibe "signup page" do


 it "make sure that the title is entered correctly" do
visit '/signup'
page.should have_title("Demo App | Sign Up")

 end

it "make sure that the about_page header "h1" is correct" do
visit '/signup'

 within 'h1' do 
 	page.should have_content "Sign up" 
 end 

 end


  end
end
