class EntriesController < ApplicationController
	before_filter :authenticate_user!
	# TODO: only the authorized user can create/view entries

	def new
		@entry = Entry.new
	end
	
	def show
		@entry = Entry.find(params[:id])
		if @entry.user_id != current_user.id
			flash[:notice] = "The entry does not belong to you!"
			redirect_to(:action => 'show_entries_by_user')
		end
	end

	def create
		@entry = Entry.new(entry_params)

		if @entry.save
			redirect_to(:action => 'show_entries_by_user')
		else
			flash[:notice] = "The entry could not be saved!"
		    redirect_to(:action => 'new')
		end
	end

	def show_entries_by_user
		if user_signed_in?
			@entries = Entry.get_entries_by_user(current_user.id)
		else
			flash[:notice] = "You are not logged in!"
			redirect_to(:controller => 'visitors', :action => 'index')
		end
	end

	private
		def entry_params
			params.require(:entry).permit(:user_id, :device, :content, :message)
		end

end