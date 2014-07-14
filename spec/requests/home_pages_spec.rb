require 'rails_helper'

describe "Home Pages" do 
	describe "home Page" do

		it "makes sure that title is entered correctly" do 
			visit '/Home_Pages/home'
			page.should have_selector('title',
				:text => "Demo App | Home")

		end

		it "makes sure that the description is entered correctly" do
		visit '/Home_Pages/home'
		
		end 

	end

	describe "About Page" do


		it "makes sure that title is entered correctly" do 
			visit '/Home_Pages/About'
			page.should have_selector('title',
				:text => "Demo App | About us")
	
	end

end
end

  

