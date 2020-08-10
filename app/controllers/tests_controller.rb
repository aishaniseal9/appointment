class TestsController < ApplicationController
    def index
        if params[:search]
            @tests= Test.where('name ILIKE ?',"%#{params[:search]}%")
        else
        @tests=Test.all
        end
    end
    def list
        @tests=Test.all
    end
    def new
        @test=Test.new
        @hospitals=Hospital.all
        @hospital_test =@test.hospital_tests.build
    end
    def edit
        @test=Test.find(params[:id])
        
    end
    def create
        @test=Test.new(test_params)
        params[:hospitals][:ids].each do |hospital|
            if !hospital.empty?
                @test.hospital_tests.build(:hospital_id => hospital)
            end
        end
        if @test.save
            redirect_to @test
        else 
            render 'new'
        end
    end
    def update
        @test = Test.find(params[:id])
   
        if @test.update(test_params)
          redirect_to @test
        else
          render 'edit'
        end
    end
    def show   
        @test= Test.find(params[:id])
        #@hospital=Hospital.find_by(params[:hospital_Hname=>'Apollo'])

    end
    def destroy
        @test=Test.find(params[:id])
        @test.destroy
        redirect_to tests_path
    end
private 
    def test_params
        params.require(:test).permit(:name, :testdescription, :testamount)
    end
end
