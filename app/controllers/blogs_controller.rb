class BlogsController < ApplicationController
  def home
  end

  def about
  end

  def contact 

#redirect_to root_url, :notice => "Email sent with subject #{params['subject']} and body #{params['body']}}"
  end


 def send_email
 	# should send email and redirect to home page.!
redirect_to root_url, :notice => "Email sent with subject #{params['subject']} and body #{params['body']}}"
 end

end
