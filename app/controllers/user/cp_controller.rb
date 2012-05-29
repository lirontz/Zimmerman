class User::CpController < ApplicationController
	before_filter :authenticate_user!

	def index
		@main_focused= "active"
		@main_focused_active = "in"
		@requests = []
	end
end
