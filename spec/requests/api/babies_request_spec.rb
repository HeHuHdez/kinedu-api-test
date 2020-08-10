# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Api::Babies', type: :request, swagger_doc: 'v1/swagger.yaml' do
  path '/api/babies' do
    get 'Index' do
      description 'Returns 25 babies per page, if page is not specified, then the result will be the page number 1'
      tags 'Babies'
      parameter name: :Authorization, in: :header, default: 'Token '
      parameter name: :page, in: :query, required: false, type: :string, default: 1
      produces 'application/json'
      before { create_list(:baby, 50) }

      response '200', 'with valid auth_token' do
        let(:Authorization) { "Token #{create(:user).auth_token}" }

        include_context 'with integration test'
      end

      include_context 'with expired/wrong auth_token'
    end
  end

  path '/api/babies/{id}/activity_logs' do
    get 'Logs from babies' do
      description 'Returns the 25 activity logs from the baby. If page is not specified, then the result will be the page number 1'
      tags 'Babies'
      parameter name: :Authorization, in: :header, default: 'Token '
      parameter name: :page, in: :query, required: false, type: :string, default: 1
      parameter name: :id, in: :path, default: 1
      produces 'application/json'

      response '200', 'with valid auth_token and valid id' do
        let(:Authorization) { "Token #{create(:user).auth_token}" }
        let(:id) { create(:activity_log).baby.id }

        include_context 'with integration test'
      end

      response '404', 'with valid auth_token and invalid id' do
        let(:Authorization) { "Token #{create(:user).auth_token}" }
        let(:id) { 25_525_252 }

        include_context 'with integration test'
      end

      include_context 'with expired/wrong auth_token'
    end
  end
end
