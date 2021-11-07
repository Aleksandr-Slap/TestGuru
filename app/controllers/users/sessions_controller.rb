# frozen_string_literal: true

module Users
  class SessionsController < Devise::SessionsController
    def create
      super
      set_flash_message! :notice, :custom_signed_in, user_first_name: resource.first_name,
                                                     user_last_name: resource.last_name
    end
  end
end
