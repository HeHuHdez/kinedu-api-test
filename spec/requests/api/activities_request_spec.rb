# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Api::Activities', type: :request, swagger_doc: 'v1/swagger.yaml' do
  path '/api/activities' do
    get 'Index' do
      description 'Returns 25 activities per page, if page is not specified, then the result will be the page number 1'
      tags 'Activities'
      parameter name: :Authorization, in: :header, default: 'Token '
      parameter name: :page, in: :query, required: false, type: :string, default: 1
      produces 'application/json'
      before { create_list(:activity, 50) }

      response '200', 'with valid auth_token' do
        let(:Authorization) { "Token #{create(:user).auth_token}" }

        include_context 'with integration test'
      end

      include_context 'with expired/wrong auth_token'
    end
  end
end
