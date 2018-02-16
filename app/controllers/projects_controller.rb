class ProjectsController < ApplicationController

	#TODO
	# IF A USER HAS A PROJECT HE OR SHE CANNOT CREATE A NEW ONE
	# p = Project.where(user_id:, current_user.id).first

	before_action :find_project, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, only: [:show, :new, :edit, :update, :destroy]


	def create
		@project = current_user.build_project(project_params)	
		if @project.save
			flash[:success] = "Project was successfully saved !"
			redirect_to root_path
		else
			flash.now[:danger] = @project.errors.full_messages.to_sentence
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
	end

	def new 
		# associate user_id with a new book
		# a user has_many :books
		# a book belongs_to :user
		if Project.where(user_id: current_user.id).exists?
			flash[:danger] = "You can only create one project"
			redirect_to root_path
		else	
			@project = current_user.create_project
		end	
	end

	def update
		if @project.update(project_params)
			flash[:success] = "Post was successfully updated !"
			redirect_to root_path
		else
			flash.now[:danger] = @project.errors.full_messages.to_sentence
			render 'edit'
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
