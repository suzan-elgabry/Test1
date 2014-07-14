require 'rails_helper'

describe "home_Page" do 
	describe "home Page" do

		it "makes sure that title is entered correctly" do 
			visit '/home_page/home'
			page.should have_title("Demo App | Home")

		end

		it "makes sure that the description is entered correctly" do
		visit '/home_page/home'

         expect(page).to have_meta({"description" =>"This is the home page"})
		
		end 

	

	end

	describe "About Page" do


		it "makes sure that title is entered correctly" do 
			visit '/home_page/about'
			page.should have_title(
				"Demo App | About Us")
	
	end

it "makes sure that the description is entered correctly" do
		visit '/home_page/about'

         expect(page).to have_meta({"description" =>"This is the about page"})
		
		end 


end

describe "Contact Page" do


		it "makes sure that title is entered correctly" do 
			visit '/home_page/contact'
			page.should have_title("Demo App | Contact Us")
	
	end
end
describe "About Page" do


		it "makes sure that title is entered correctly" do 
			visit '/home_page/location'
			page.should have_title("Demo App | Location")
	
	end
end
end

  

