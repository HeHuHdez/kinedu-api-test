# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'Api::ActivityLogs', type: :request, swagger_doc: 'v1/swagger.yaml' do
  path '/api/activity_logs' do
    post 'Create' do
      description 'Creates a new activity_log based on baby_id, activity_id and assistant_id '
      tags 'ActivityLogs'
      parameter name: :Authorization, in: :header, default: 'Token '
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          activity_log: {
            baby_id: { type: :integer },
            activity_id: { type: :integer },
            assistan_id: { type: :integer },
            start_time: { type: :integer },
            stop_time: { type: :integer },
            comments: { type: :string },
            required: %w[baby_id activity_id assistant_id start_time],
            example: {
              "baby_id": 1,
              "activity_id": 1,
              "assistant_id": 1,
              "start_time": Time.zone.now.strftime('%Y-%m-%dT%H:%M:%S.%L%z'),
              "stop_time": nil,
              "comments": nil
            }
          },
          required: ['activity_log']
        }
      }
      produces 'application/json'

      response '201', 'with valid auth_token and valid params' do
        let(:Authorization) { "Token #{create(:user).auth_token}" }
        let(:params) do
          {
            activity_log: {
              baby_id: create(:baby).id,
              activity_id: create(:activity).id,
              assistant_id: create(:assistant).id,
              start_time: Time.zone.now.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
            }
          }
        end
        include_context 'with integration test'
      end

      response '422', 'with valid auth_token and invalid params' do
        let(:Authorization) { "Token #{create(:user).auth_token}" }
        let(:params) do
          {
            activity_log: {
              baby_id: 1,
              activity_id: 1,
              assistant_id: 1,
              start_time: Time.zone.now.strftime('%Y-%m-%dT%H:%M:%S.%L%z')
            }
          }
        end
        include_context 'with integration test'
      end

      include_context 'with expired/wrong auth_token'
    end
  end

  path '/api/activity_logs/{id}' do
    put 'Update' do
      description 'Updates an activity_log'
      tags 'ActivityLogs'
      parameter name: :Authorization, in: :header, default: 'Token '
      parameter name: :id, in: :path, default: 1
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          activity_log: {
            baby_id: { type: :integer },
            activity_id: { type: :integer },
            assistan_id: { type: :integer },
            start_time: { type: :integer },
            stop_time: { type: :integer },
            comments: { type: :string },
            required: %w[baby_id activity_id assistant_id start_time],
            example: {
              "stop_time": 5.minutes.from_now.strftime('%Y-%m-%dT%H:%M:%S.%L%z'),
              "comments": "No comments"
            }
          },
          required: ['activity_log']
        }
      }
      produces 'application/json'

      response '200', 'with valid auth_token and valid params' do
        let(:Authorization) { "Token #{create(:user).auth_token}" }
        let(:id) { create(:activity_log).id }
        let(:params) do
          {
            activity_log: {
              stop_time: 5.minutes.from_now.strftime('%Y-%m-%dT%H:%M:%S.%L%z'),
              comments: 'No comments'
            }
          }
        end
        include_context 'with integration test'
      end

      response '422', 'with valid auth_token and invalid params' do
        let(:Authorization) { "Token #{create(:user).auth_token}" }
        let(:id) { create(:activity_log).id }
        let(:params) do
          {
            activity_log: {
              stop_time: 5.minutes.ago.strftime('%Y-%m-%dT%H:%M:%S.%L%z'),
              comments: 'No comments'
            }
          }
        end
        include_context 'with integration test'
      end

      response '404', 'with valid auth_token and invalid id' do
        let(:Authorization) { "Token #{create(:user).auth_token}" }
        let(:id) { 25_525_252 }
        let(:params) do
          {
            activity_log: {
              stop_time: 5.minutes.from_now.strftime('%Y-%m-%dT%H:%M:%S.%L%z'),
              comments: 'No comments'
            }
          }
        end

        include_context 'with integration test'
      end

      include_context 'with expired/wrong auth_token'
    end
  end

  path '/api/activity_logs/{id}' do
    delete 'Destroy' do
      description 'Destroys an activity_log'
      tags 'ActivityLogs'
      parameter name: :Authorization, in: :header, default: 'Token '
      parameter name: :id, in: :path, default: 1
      produces 'application/json'

      response '204', 'with valid auth_token and valid id' do
        let(:Authorization) { "Token #{create(:user).auth_token}" }
        let(:id) { create(:activity_log).id }
        run_test!
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
