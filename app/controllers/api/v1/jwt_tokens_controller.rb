class Api::V1::JwtTokensController < ApplicationController
  require 'jwt'

  # POST /api/v1/jwt_token
  def create
    ipphone    = params[:ipphone]
    expired    = params[:expired]
    secret_key = params[:secret_key]

    if ipphone.blank? || secret_key.blank?
      render json: { error: 'Missing parameters' }, status: :bad_request
      return
    end

    payload = { ipphone: ipphone }
    payload[:exp] = expired.to_i if expired.present?

    token = JWT.encode(payload, secret_key, 'HS256', { typ: 'JWT' })
    render json: { token: token }, status: :ok
  rescue => e
    render json: { error: e.message }, status: :unprocessable_entity
  end
end