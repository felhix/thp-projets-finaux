class ProjectsController < ApplicationController

	#TODO
	# add project creation and registion date limit 
	# maybe add open/closed registration status

	before_action :find_project, only: [:project_creator_unregister_user, :unregister, :register, :show, :edit, :update, :destroy]

  before_action :authenticate_user!, only: [:project_creator_unregister_user, :unregister, :register, :show, :new, :edit, :update, :destroy]


	def create
		@project = current_user.build_project(project_params)	
		if @project.save
			@project.users << current_user
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
		if @project.update(project_params)
			flash[:success] = "Post was successfully updated !"
			redirect_to root_path
		else
			flash.now[:danger] = @project.errors.full_messages.to_sentence
			render 'edit'
		end		
	end

	  def register
	  	begin
		  	@project.users << current_user
		 	  flash[:success] = "Vous participez à #{@project.title} !" 
		   	redirect_to show_project_path
		  rescue
		  	flash[:danger] = "Oops veuillez réessayer !" 
		   	redirect_to show_project_path		  
		  end 	 
 		end

 		def unregister
 			begin
 			 @project.users.destroy(current_user)
 			 flash[:success] = "Vous ne participez plus à #{@project.title} !" 
	   	 redirect_to show_project_path
	   	rescue
		    flash[:danger] = "Oops veuillez réessayer !" 
		   	redirect_to show_project_path		  
		  end  
 		end	


  def project_creator_unregister_user(user)
    begin
    	user = user.find(params[:id])
    	if user.id != @project.user_id
	      @project.users.destroy(user)
	       flash[:success] = "Vous avez désinscris #{user.first_name.capitalize!} !" 
	       redirect_to show_project_path
      else 
      	flash[:success] = "Vous ne pouvez pas vous désinscrire de votre projet !" 
	       redirect_to show_project_path
      end	
      rescue
        flash[:danger] = "Oops veuillez réessayer !" 
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
