class ApplicationController < ActionController::Base
  protect_from_forgery
  include Mobylette::RespondToMobileRequests
  include SessionsHelper
  
	mobylette_config do |config|
		config[:fall_back] = :html
		config[:skip_xhr_requests] = false
	end
end
