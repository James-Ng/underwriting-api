require 'rails_helper'

RSpec.describe BorrowersController, type: :controller do
  describe 'POST #create' do
    context 'when is successfully created' do
      # create mock random data for testing
      before(:each) do
        @property_type = FactoryGirl.create(:property_type, is_active: true)
        @borrower_attributes = FactoryGirl.attributes_for(:borrower)
        @borrower_attributes[:property_type_id] = @property_type.id
        @borrower = { borrower: @borrower_attributes }

        post :create, @borrower
      end

      it 'renders the json representation for the borrower record just created' do
        borrower_response = JSON.parse(response.body, symbolize_names: true)
        expect(borrower_response[:email]).to eql @borrower_attributes[:email]
      end

      it { should respond_with 201 }
    end

    context 'when is successfully not created' do
      before(:each) do
        @property_type = FactoryGirl.create(:property_type, is_active: false)
        @borrower_attributes = FactoryGirl.attributes_for(:borrower)
        @borrower_attributes[:property_type_id] = @property_type.id
        @borrower_attributes[:last_name] = nil
        @borrower_attributes[:email] = 'error_email'
        @borrower = { borrower: @borrower_attributes }
        post :create, @borrower

        @borrower_response = JSON.parse(response.body, symbolize_names: true)
      end

      it 'renders 3 errors' do
        expect(@borrower_response[:errors].size).to eql 3
      end

      it 'renders error for property eligibility' do
        expect(@borrower_response[:errors][:property_type]).to include I18n.t('errors.borrower.property_eligibility')
      end

      it 'renders error for last_name' do
        expect(@borrower_response[:errors][:last_name]).to include "can't be blank"
      end

      it 'renders error for invalid email' do
        expect(@borrower_response[:errors][:email]).to include 'is invalid'
      end
      it { should respond_with 422 }
    end
  end

  describe 'GET #index' do
    before(:each) do
      @property_type = FactoryGirl.create(:property_type, is_active: true)
      3.times { FactoryGirl.create(:borrower, property_type_id: @property_type.id) }
      get :index
    end

    it 'returns 3 records' do
      @borrower_response = JSON.parse(response.body, symbolize_names: true)
      expect(@borrower_response[:borrowers].size).to eql 3
    end

    it { should respond_with 200 }
  end
end
