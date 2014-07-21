require 'rails_helper'

describe "AuthenticationPages" do 
	subject {page}


	describe "SignIn" do
		before {visit root_path}
		
		describe "with invalid information" do
			before {click_button "Sign in"}
			
			it {should have_selector('div.alert.alert-danger', text: 'Invalid')} 
	 		
	 		describe "after visiting another page" do
		 		before{click_link "Demo Blog"}
				it {should_not have_selector('div.alert.alert-danger')}
			end
		end

		describe "with valid information" do
			let(:user) {FactoryGirl.create(:user)}
			before do
				fill_in "Email", with: user.email
				fill_in "Password", with: user.password
				click_button "Sign in"
			end

	
		it {should have_link('Profile', href: user_path(user))}	
		it {should have_link('Sign out', href: signout_path)}
		it {should_not have_css('form.signin')}

	end
end
end
	



