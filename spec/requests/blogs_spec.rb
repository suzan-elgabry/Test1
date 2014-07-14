require 'rails_helper'

RSpec.describe "Blogs", :type => :request do
  describe "GET /blogs" do
    it "works! (now write some real specs)" do
      get blogs_index_path
      expect(response.status).to be(200)
    end
end
end

describe "blog" do

	descibe "home page" do

 it "make sure that the home_page title is entered correctly" do
visit '/'
page.should have_title("Demo App")

 end



  it "make sure that the home_page header "h1" is correct" do
 visit '/'
 within 'h1' do 
 	page.should have_content "Hello, world!" 
 end 

 end

end

describe "About Page" do


 it "make sure that the about_page title is entered correctly" do
visit '/about'
page.should have_title("Demo App | About Us")

 end
 


it "make sure that the about_page header "h1" is correct" do
visit '/about'
within 'h1' do 
 	page.should have_content "About Us" 
 end 
 end


it "make sure that the 3 links goes to the correct places" do
visit '/'


end

  end



end
