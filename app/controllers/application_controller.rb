class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      new_user_session_path
    elsif resource_or_scope.is_a?(Vendor)
      new_vendor_session_path
    else
      root_path
    end
  end

  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(User)
      user_path(current_user)
    elsif resource_or_scope.is_a?(Vendor)
      vendor_path(current_vendor)
    end
  end

  def after_sign_up_path_for(resource_or_scope)
    binding.pry
    if resource_or_scope.is_a?(User)
      add_user_profile_path(current_user)
    elsif resource_or_scope.is_a?(Vendor)
      add_vendor_profile_path(current_vendor)
    end
  end


end
