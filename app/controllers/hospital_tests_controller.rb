class HospitalTestsController < ApplicationController
    def new
        @hospital_test=HospitalTest.new
    end
    def index
        @hospital_tests=HospitalTest.all
    end
    
    def edit 
        @hospital_test=HospitalTest.find(params[:id])
    end
    def create
        @hospital_test=HospitalTest.new(hospital_test_params)
        
        if @hospital_test.save
            redirect_to @hospital_test 
        else
            render 'new'
        end
    end
    def show
        @hospital_test=HospitalTest.find(params[:id])
    end 
    def update
        @hospital_test=HospitalTest.find(params[:id])
        if @hospital_test.update(hospital_test_params)
          redirect_to @hospital_test 
        else
           render 'edit'
        end
       # render plain: params[:hospital_test][:test_id].inspect
    end
    
    def destroy
        @hospital_test=HospitalTest.find(params[:id])
        @hospital_test.destroy
        redirect_to hospital_tests_path
    end
    private
    def hospital_test_params
        params.require(:hospital_test).permit(:test_id, :hospital_id)
    end
end
