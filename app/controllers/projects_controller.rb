class ProjectsController < ApplicationController
	$date_deadline = DateValidation.last
	$message_deadline = "La deadline est passée!"
	#TODO
	# add project creation and registion date limit 
	# maybe add open/closed registration status

	before_action :find_project, only: [:project_creator_unregister_user, :unregister, :register, :show, :edit, :update, :destroy]

	before_action :authenticate_user!, only: [:project_creator_unregister_user, :unregister, :register, :show, :new, :edit, :update, :destroy]


	def create
		@project = current_user.build_project(project_params)
		if datetimevalidator($date_deadline)
			if @project.save
				@project.users << current_user
				flash[:success] = "Project was successfully saved !"
				redirect_to show_project_path(@project)
			else
				flash.now[:danger] = @project.errors.full_messages.to_sentence
				render 'new'
			end
		else
			flash.now[:danger] = $message_deadline
			render 'new'
		end
	end

	def destroy
		@project.destroy
		flash[:danger] = "Project was successfully deleted !"
		redirect_to root_path
	end

	def edit
	end

	def show
		@new_comment = Comment.build_from(@project, current_user.id, "")
	end

	def new 
		# associate user_id with a new project
		# a user ONLY has_one :project
		# a project belongs_to :user
		if Project.where(user_id: current_user.id).exists?
			flash[:danger] = "You can only create one project"
			redirect_to root_path
		else	
			@project = current_user.create_project
		end	
	end

	def update
		if datetimevalidator($date_deadline)
			if @project.update(project_params)
				flash[:success] = "Project was successfully updated !"
				redirect_to root_path
			else
				flash.now[:danger] = @project.errors.full_messages.to_sentence
				render 'edit'
			end	
		else
			flash.now[:danger] = $message_deadline
			render 'edit'
		end	
	end

	def register
		if datetimevalidator($date_deadline)
			begin
				@project.users << current_user
				flash[:success] = "Vous participez à #{@project.title} !" 
				redirect_to show_project_path
			rescue
				flash[:danger] = "Oops veuillez réessayer !" 
				redirect_to show_project_path		  
			end
		else
			flash[:danger] = $message_deadline
			redirect_to show_project_path
		end	 
	end

	def unregister
		if datetimevalidator($date_deadline)
			begin
				@project.users.destroy(current_user)
				flash[:success] = "Vous ne participez plus à #{@project.title} !" 
				redirect_to show_project_path
			rescue
				flash[:danger] = "Oops veuillez réessayer !" 
				redirect_to show_project_path		  
			end 
		else
			flash[:danger] = $message_deadline
			redirect_to show_project_path
		end 
	end	


	def project_creator_unregister_user
		if datetimevalidator($date_deadline)
			begin
				user = User.find(params[:user_id])
				if user.id != @project.user_id
					@project.users.destroy(user)
					flash[:success] = "Vous avez désinscris #{user.first_name.capitalize!} !" 
					redirect_to show_project_path
				else 
					flash[:danger] = "Vous ne pouvez pas vous désinscrire de votre projet !" 
					redirect_to show_project_path
				end	
			rescue
				flash[:danger] = "Oops veuillez réessayer !" 
				redirect_to show_project_path		  
			end 
		else
			flash[:danger] = $message_deadline
			redirect_to show_project_path
		end 
	end  


	private

	def project_params
		params.require(:project).permit(:title, :description, :short_description, :pitch, :user_id)
	end

	def find_project
		@project = Project.find(params[:id])
	end


end
