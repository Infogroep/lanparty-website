require 'spec_helper'

describe Admin::UsersController do
  # This should return the minimal set of attributes required to create a valid
  # UserGroup. As you add validations to UserGroup, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "username" => "MyString", "email" => "rgerg.tzegreg@gmail.com", "password" => "erere", "password_confirmation" => "erere" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UserGroupsController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe_access(
    :login => [:index, :destroy, :show, :new, :update, :create],
    :user_editing => [:index, :destroy, :show, :new, :update, :create]
  )
end
