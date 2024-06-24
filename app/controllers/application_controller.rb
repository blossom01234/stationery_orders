class ApplicationController < ActionController::Base
    def check_user_sign_in_status
        if user_signed_in?
            redirect_to new_user_session_path
        end
    end

    def check_customer_sign_in_status
        unless customer_signed_in?
            redirect_to new_customer_session_path
        end
    end
end
