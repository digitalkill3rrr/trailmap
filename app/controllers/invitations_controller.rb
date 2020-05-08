class InvitationsController < ApplicationController
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:accept_invitation, keys: [:name, :email, :invitation_token, :role])
    end
end
