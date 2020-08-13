class HospitalsController < ApplicationController
    def index
        respond_to do |format|
        if params[:search].present?
            @hospitals=Hospital.search_by_hospital_name(params[:search]).with_pg_search_highlight
        else
        @hospitals=Hospital.all
        end
        format.json
        format.html
    end
    end
    def show
        if params[:query].present?
            @hospital=Hospital.find(params[:id])
            @tests=@hospital.tests.where("name ilike ?","%#{params[:query]}%")
        else
        @hospital=Hospital.find(params[:id])
        end
    end
    def list
        @hospitals=Hospital.all
    end
    def new
        @hospital=Hospital.new
        @tests=Test.all
        @hospital_test =@hospital.hospital_tests.build
    end
    def create
        @hospital=Hospital.new(hospital_params)
       
        if params[:tests][:ids]
        params[:tests][:ids]= params[:tests][:ids].reject(&:empty?).map(&:to_i)
         params[:tests][:ids].each do |test|
        
            @hospital.hospital_tests.build(:test_id => test)
        end
    end

        if @hospital.save
            redirect_to @hospital
        else
            render 'new'
        end
    end
    def edit 
        @hospital=Hospital.find(params[:id])
        @tests=Test.all
        @hospital_test =@hospital.hospital_tests.build
    end
    def update
        @hospital=Hospital.find(params[:id])
        if params[:tests][:ids]
            params[:tests][:ids]=params[:tests][:ids].reject(&:empty?).map(&:to_i)
            old_tests=@hospital.tests.pluck(:test_id)
            hospitalid=params[:id]
            new_tests=params[:tests][:ids]-old_tests
            old_tests=old_tests-params[:tests][:ids]
            new_tests.each do |test|
                @hospital.hospital_tests.build(:test_id => test)
            end
            HospitalTest.delete_by(hospital_id: [hospitalid],test_id: [old_tests])
        end
        if @hospital.update(hospital_params)
            redirect_to @hospital
          else
            render 'edit'
          end
    end
    def destroy
        @hospital=Hospital.find(params[:id])
        @hospital.destroy
        redirect_to hospitals_path
    end
    private
    def hospital_params
        params.require(:hospital).permit(:Hname,:Haddress,:contact,:email,:website,:no_of_test,hospital_tests_attributes: [:id,:test_id,:hospital_id])
    end

end
