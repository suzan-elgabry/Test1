require 'rails_helper'


describe "Users" do

	before{@user=User.new(name: "Example User" , email: "user@example.com"  , password: "foobarbaz", password_confirmation: "foobarbaz")}

 	subject {@user}
 	it {should respond_to(:name)}
    it {should respond_to(:email)}
    it {should respond_to(:password_digest)}
    it {should respond_to(:password)}
    it {should respond_to(:password_confirmation)}
    it {should be_valid}

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

       


describe "name is not present" do
	before {@user.name=" "}
	it {should_not be_valid}
end

describe "email is not present" do 
	before {@user.email=" "}
	it {should_not be_valid}
end

describe "email is too long " do 
	before {@user.name= "a" * 41}
	it {should_not be_valid}
end

describe "email format is invalid" do
	it "should be invalid" do
		addresses=%w[user@foo,com user_at_foo.org example.user@foo.]
		addresses.each do |invalid_address|
			@user.email=invalid_address
			@user.should_not be_valid
		end
	end
end

describe "email format is valid" do
	it "should be valid" do
		addresses=%w[user@foo.com A_user@foo.b.org a+b@foo.jp]
		addresses.each do |valid_address|
			@user.email=valid_address
			@user.should be_valid
		end
	end
end

describe "when email is already taken" do
	before do 
		user_with_same_email=@user.dup
		user_with_same_email.email=@user.email.upcase
		user_with_same_email.save
	end
	it {should_not be_valid}
end



describe "when password is not present" do 
	before {@user.password=@user.password_confirmation=" "}
	it {should_not be_valid}

end


describe "when password doesnot match the confirmation" do 
	before {@user.password_confirmation="mismatch"}
	it {should_not be_valid}
end

describe "when passwrod confirmation is nil" do 
	before {@user.password_confirmation= nil}
	it {should_not be_valid}
end

describe "when password is too short" do 
	before {@user.password=@user.password_confirmation = "a" *7}
	it {should_not be_valid}
end


end
