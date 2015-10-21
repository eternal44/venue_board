class Admins::RegistrationsController < Devise::RegistrationsController
  # disable default no_authentication action
  skip_before_action :require_no_authentication, only: [:new, :create, :cancel]

  # now we need admin to register new admin
  prepend_before_action :authentication_scope!, only: [:new, :create, :cancel]

  protected

  def sign_up(resource_name, resource)
    # just overwrite the default one to prevent auto sign in as the new sign up
    # note:  is this a blank overwrite?
  end
end
