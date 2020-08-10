class BookingsController < ApplicationController
    def new 
        #@user=User.find(params[:user_id])
        #@hospital_test=HospitalTest.where("id = ?",params[:hospital_test_id]).first
        @booking=Booking.new
       
        
    end
    def show 
        @booking=Booking.find(params[:id])
        #@hospital_test=HospitalTest.find_by(id: params[:hospital_test_id])
    end
    def index
        @bookings=Booking.all
    end
    def edit
        @booking=Booking.find(params[:id])
    end
    def create
        #@user=User.find(params[:user_id])
        #@hospital_test=HospitalTest.where("id = ?",params[:booking][:hospital_test_id]).first
        #@booking=Booking.new(booking_params)
        
        @booking.user=@user
        #@booking.bookingdate=Date.today
        if @booking.save
            redirect_to @user
        else
            render 'new'
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
        @booking=Booking.find(params[:id])
        @booking.destroy
        redirect_to user_bookings_path
    end
    private
    def booking_params
        params.require(:booking).permit(:hospital_test_id, :user_id)
    end
end
