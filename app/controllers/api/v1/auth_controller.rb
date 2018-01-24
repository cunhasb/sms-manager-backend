require 'google/apis/gmail_v1'
require 'google/api_client/client_secrets'
require 'json'
require 'mail'
require_relative '../../../mailers/new_user_mailer.rb'
Gmail = Google::Apis::GmailV1 # Alias the module
class Api::V1::AuthController < ApplicationController
    def show
      user = User.find(params["id"])
      render json:{
      name: user.name,
      family_name: user.family_name,
      given_name: user.given_name,
      email: user.email,
      phone: user.phone,
      image_url: user.image_url,
      campaigns: user.campaigns
    }

    end
    def create
      # debugger
      if params["user"]["id"]
        user = User.find(params["user"]["id"])
        # user = User.all.first
      else
        # byebug
        client_secrets= Google::APIClient::ClientSecrets.load(ENV["G_SECRETS"])
        auth_client = client_secrets.to_authorization
        auth_client.update!(
          :scope=>"profile https://mail.google.com/",
          :redirect_uri => 'postmessage',
          :access_type => "offline",         # offline access
          :include_granted_scopes => "true"  # incremental auth
        )
        auth_client.code = auth_profile["code"]
        result = auth_client.fetch_access_token!
        # byebug
        user =User.create_with(auth_profile).find_or_create_by(g_id: auth_profile["g_id"])
        result.keys.each {|key| key !="user_id" ? user[key]=(result[key]): nil}
        user.save
      end
      service = Gmail::GmailService.new
      service.authorization = user.access_token
      # Add_phone_number(service,providers="","17323376090","Trying out finding provider")

      # byebug

      render json:{
        user:{
          id: user.id,
          id_token: user.id_token,
          name: user.name,
          family_name: user.family_name,
          given_name: user.given_name,
          email: user.email,
          phone: user.phone,
          image_url: user.image_url},
        campaigns: user.campaigns,
        customers: user.customers,
        status: 200,
    }


    end


    private

    def auth_profile
      params.require(:user).permit(:g_id,:email,:name,:family_name,:given_name,:image_url,:code)
    end

end
