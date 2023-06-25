# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
    protected
        def sign_up_params
            params.require(:user).permit(:username)
        end
end