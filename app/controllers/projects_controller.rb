class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Great, a new project has been added!"
      redirect_to @project
    else
      flash.now[:error] = "Fix your project, it could not be saved!"
      flash[:alert] = "Your name isn't really that short!"
      flash[:alert] = "Technologies used can't be blank."
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      redirect_to project_path(@project), notice: "Your project has been updated!"
    else
      flash.now[:error] = "You goofed it up!"
      render :edit
    end
  end

  def destroy
    @project.destroy
    flash[:alert] = "Project deleted!"
    redirect_to projects_path
  end

private
  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :technologies_used)
  end
end
