require 'test_helper'
require_relative '../../../helpers/authorization_helper'

module Api
  module Reference
    class CompaniesControllerTest < ActionDispatch::IntegrationTest
      include AuthorizationHelper

      test 'should get index' do
        get '/api/reference/company', headers: { Authorization: token }
        assert_response 200
      end

      test 'should get dropdown' do
        get '/api/reference/company/dropdown', headers: { Authorization: token }
        assert_response 200
      end

      test 'should create a company' do
        post '/api/reference/company', params: create_params, headers: { Authorization: token }
        assert_response 201
      end

      # test 'should show a company' do
      #   get "/api/reference/company/#{User.first.companies.first.id}", headers: { Authorization: token }
      #   assert_response 200
      # end

      # test 'should update a company' do
      #   put "/api/reference/company/#{User.first.companies.last.id}", params: params, headers: { Authorization: token }
      #   assert_response 200
      # end

      # test 'should delete a company' do
      #   delete "/api/reference/company/#{User.first.companies.last.id}", headers: { Authorization: token }
      #   head 204
      # end

      # def create_params
      #   {
      #     user_id: User.first.id,
      #     npwp: '123456789012346',
      #     name: 'Abel & Company',
      #     address: 'Taman Berdikari Sentosa',
      #     block: 'H',
      #     number: '3-5',
      #     rt: '02',
      #     rw: '03',
      #     village: 'Pejaten',
      #     subdistrict: 'Rawamangun',
      #     regency: 'Jakarta Timur',
      #     province: 'DKI Jakarta',
      #     postal_code: '80114',
      #     phone: '0811213305',
      #     is_dropdown: true
      #   }
      # end
    end
  end
end
