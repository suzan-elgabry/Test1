require 'rails_helper'


describe "Users" do

	subject {page}


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

    	 describe "with invalid information" do 
 		it "should not create a user " do 
 			visit '/signup'
 		old_count = User.count;
 		click_button "Create my account"
 		new_count = User.count
 		new_count.should ==old_count
 		end
    	 end

    	 describe "with valid information" do 

    	 	before {
    	 		visit signup_path
    	 		within "form#new_user" do
		    	 		fill_in "Name" , with: "Example User"
		    	 		fill_in "Email" , with: "user@example.com"
		    	 		fill_in "Password" , with: "foobarbaz"
		    	 		fill_in "Confirmation" , with: "foobarbaz"
					end
    	 	}

	    	 it "should create a user" do 
	    	 		old_count = User.count
					click_button "Create my account"
		    	 	new_count = User.count
		    	 	new_count.should == old_count + 1
	    	 end

	    	 describe "after saving a user" do 
	    	 	let (:user) {User.find_by_email("user@example.com")}
         		 before{
         		 	click_button "Create my account"
         		 }
		    	 it "should have correct title" do
		    	 	expect(page).to have_title(user.name)
		    	 end
		    	 it {should have_link('Sign out')}

    	 	 end
	    	
    	 end

 		

    end

       
describe "profile page" do 

	let (:user) {FactoryGirl.create(:user)}

	it "make sure that the title is entered correctly" do
	    	visit user_path(user)
	    	page.has_title?(user.name)
	 	end

    	it "make sure that the about_page header 'h1' is correct" do
    		visit user_path(user)
    		#save_and_open_page
    		within 'h1' do 
 				page.should have_content user.name 
     		end 

    	 end

end 


describe "edit page" do
	let(:user) {FactoryGirl.create(:user)}

	describe "page" do 
		before{ visit edit_user_path(user)}
		it {should have_selector('h1', text:"Update your profile")}
		it {should has_title?(user.name)}
	    	
	end

end

end
