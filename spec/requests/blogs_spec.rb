require 'rails_helper'



describe "blog" do

	describe "home page" do

 it "make sure that the home_page title is entered correctly" do
visit '/'
page.has_title?("Demo App")

 end



  it "make sure that the home_page header 'h1' is correct" do
 visit '/'
 within 'h1' do 
 	page.should have_content "Hello, world!" 
 end 

 end

end

describe "About Page" do


 it "make sure that the about_page title is entered correctly" do
visit '/about'
page.has_title?("Demo App | About Us")

 end
 


it "make sure that the about_page header 'h1' is correct" do
visit '/about'
within 'h1' do 
 	page.should have_content "About Us" 
 end 
 end


it "make sure that the 3 links goes to the correct places" do
visit '/'
click_link "Demo Blog"
page.has_selector?'title' ,text: full_title('Demo')
click_link "About Us"
page.has_selector? 'title' ,text: full_title('Demo | About Us')
click_link "Sign Up"
page.has_selector? 'title' ,text: full_title('Demo | Sign Up')



end

  end



end
