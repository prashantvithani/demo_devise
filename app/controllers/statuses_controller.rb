class StatusesController < ApplicationController
	
	def index
		@statuses = Status.all

		respond_to do |format|
			format.html
			format.json{render json: @statuses}
		end
	end

	def show

		@status = Status.find(params[:status_id])

		# respond_to do |format|
		# 	format.html
		# 	format.json{render json: @status}
		# end
	end	

	def new
		@status = Status.new
	end

	def create
		@status = Status.new(params[:status])

		if @status.save
			flash[:notice] = "status created successfully"
			redirect_to(:action => 'index')
		else
			render(:action => 'new')
		end
	end

	def edit
		@status = Status.find(params[:status_id])
	end

	def update
		@status = Status.find(params[:status_id])
		if @status.update_attributes(params[:status])
			#if status success
			flash[:notice] = "status edited"
			redirect_to(:action => 'show', :status_id => @status.id)
		else
			#if status fails
			render(:action => 'edit')
		end
	end

	def delete
		@status = Status.find(params[:status_id])
	end

	def destroy
		Status.find(params[:status_id]).destroy
		flash[:notice] = "status deleted"
		redirect_to(:action => 'index')
	end
end


	