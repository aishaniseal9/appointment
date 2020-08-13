class Users::BookingsController < ApplicationController
    before_action:authenticate_user! 
    def new 
        @user=User.find(params[:user_id])
        @hospital_test=HospitalTest.where("id = ?",params[:hospital_test_id]).first
        @booking=Booking.new
       
        
    end
    def show 
        @booking=Booking.find(params[:id])
        #@hospital_test=HospitalTest.find_by(id: params[:hospital_test_id])
    end
    def index
        @user=User.find(params[:user_id])
        @bookings=@user.bookings.all
    end
    def edit
        @booking=Booking.find(params[:id])
    end
    def create
        @user=User.find(params[:user_id])
        @hospital_test=HospitalTest.where("id = ?",params[:booking][:hospital_test_id]).first
        @booking=Booking.new(booking_params)
        
        @booking.user=@user
        #@booking.bookingdate=Date.today
        respond_to do |format|
        if @booking.save
            format.html {redirect_to @user, notice: 'Appointment created successfully'}
        else
            format.html {redirect_to @user, notice: 'Appointment already exists'}
        end
    end
    end
    def update
        @booking=Booking.find(params[:id])
        if(@booking.update(booking_params))
            redirect_to @user
        else
            render 'edit'
        end
    end
    def destroy
        @user=User.find(params[:user_id])
        @booking=Booking.find(params[:id])
       @booking.destroy 
        redirect_to user_path(@user)
    end
    private
    def booking_params
        params.require(:booking).permit(:user_id, :hospital_test_id,:bookingdate)
    end
end
