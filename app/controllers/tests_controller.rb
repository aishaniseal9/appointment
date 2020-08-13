class TestsController < ApplicationController
    def index
        if params[:query].present?
            @tests= Test.where('name ilike ?',"%#{params[:query]}%")
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
        @hospitals=Hospital.all
        @hospital_test=@test.hospital_tests.build
        
    end
    def create
        @test=Test.new(test_params)
        if params[:hospitals][:ids]
            params[:hospitals][:ids]= params[:hospitals][:ids].reject(&:empty?).map(&:to_i)
        params[:hospitals][:ids].each do |hospital|
            
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
        if params[:hospitals][:ids]
            params[:hospitals][:ids]=params[:hospitals][:ids].reject(&:empty?).map(&:to_i)
            old_hospitals=@test.hospitals.pluck(:hospital_id)
            testid=params[:id]
            new_hospitals=params[:hospitals][:ids]-old_hospitals
            old_hospitals=old_hospitals-params[:hospitals][:ids]
            new_hospitals.each do |hospital|
                @test.hospital_tests.build(:hospital_id => hospital)
            end
            HospitalTest.destroy_by(hospital_id: [old_hospitals],test_id: [testid])
        end
        if @test.update(test_params)
          redirect_to @test
        else
          render 'edit'
        end
    end
    def show   
        if params[:hospital].present?
            @test=Test.find(params[:id])
            @hospitals=@test.hospitals.where(id:params[:hospital][:ids])
        else
        @test=Test.find(params[:id])
        end
       #@test= Test.find(params[:id])
        #@hospital=Hospital.find_by(params[:hospital_Hname=>'Apollo'])

    end
    def destroy
        @test=Test.find(params[:id])
        @test.destroy
        redirect_to tests_path
    end
private 
    def test_params
        params.require(:test).permit(:name, :testdescription, :testamount,hospital_tests_attributes: [:id,:test_id,:hospital_id])
    end
end
