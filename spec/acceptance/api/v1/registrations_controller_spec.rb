require "rails_helper"
require "rspec_api_documentation/dsl"

describe Api::V1::RegistrationsController do
  resource "API -- REGISTRATIONS" do
    include_context :api_headers

    post "/api/v1/signup" do
      parameter :full_name, "User full name", scope: :user
      parameter :email, "User email", scope: :user
      parameter :password, "User password", scope: :user

      let(:password) { "password" }
      let(:email) { "email@example.com" }
      let(:full_name) { "nickname" }

      let(:created_user) { User.find_by(authentication_token: json_response_body["authentication_token"]) }
      let(:expected_response) { { "authentication_token" => created_user.authentication_token } }

      example_request "REGISTRATIONS [success] -- Create a user" do
        expect(status).to eq(201)
        expect(json_response_body).to eq(expected_response)
      end
    end

    post "/api/v1/signup" do
      parameter :full_name, "User full name", scope: :user
      parameter :email, "User email", scope: :user
      parameter :password, "User password", scope: :user

      let(:password) { "password" }
      let(:email) { "email@example.com" }
      let(:full_name) { "nickname" }

      let!(:created_user) { create :user, email: email }

      example_request "REGISTRATIONS [fail] -- bad request" do
        expect(response_status).to be(422)
        expect(json_response_body["errors"]).to eq("Email has already been taken")
      end
    end
  end
end
