require 'rails_helper'


describe "Users" do

	describe "signup page" do


 it "make sure that the title is entered correctly" do
visit '/signup'
page.has_title?("Demo App | Sign Up")

 end

it "make sure that the about_page header 'h1' is correct" do
visit '/signup'

 within 'h1' do 
 	page.should have_content "Sign up" 
 end 

 end


  end
end
