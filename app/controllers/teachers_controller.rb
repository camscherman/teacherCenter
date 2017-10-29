class TeachersController < ApplicationController

  before_action :find_teacher, only:[:edit, :update]
  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      flash[:notice]= "Thank you for signing up!"
      session[:user_id] = @teacher.id
    else
      flash[:alert] = "There are errors"
      render :new
    end
  end

  def edit
  end

  def update
    if(@teacher.update(teacher_params))
      flash[:notice] ="Details Updated"
      redirect_to root_path
    else
      flash[:alert] = "Something went wrong"
      render :edit
    end  
  end

  private
  def teacher_params
    params.require(:teacher).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  def find_teacher
    @teacher = Teacher.find(params[:id])
  end
end
