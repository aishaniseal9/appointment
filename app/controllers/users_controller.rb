class UsersController < ApplicationController
  before_action:authenticate_user! ,except: [:show,:index]
  def new
    @user=User.new
  end
  def index
    @users=User.all
  end
  def show
      @user= User.find(params[:id])
      @bookings=@user.bookings
      @hospital_tests=HospitalTest.all
  end
  def edit
    @user = User.find(params[:id])
  end

  def create
    @user=User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  def update
    @user = User.find(params[:id])
   
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end
  def destroy
    @user = User.find(params[:id])
    
     respond_to do |format|
      if @user.destroy
        format.html{redirect_to welcome_index_path,notice: 'User successfully destroyed'}
      else
        format.html{redirect_to user_path(@user),notice: 'User cannot be destroyed'}
      end   
    end
    #redirect_to welcome_index_path
  end

  private 
  def user_params
    params.require(:user).permit(:name, :contactno, :address, :email, :dob, :bloodgrp)
  end

 end
