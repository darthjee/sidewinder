# frozen_string_literal: true

module AdminPage
  extend ActiveSupport::Concern
  include OnePageApplication
  include LoggedUser

  included do
    redirection_rule :redirect_admin, :forbidden?
  end

  private

  def redirect_admin
    "#/forbidden"
  end

  def forbidden?
    ! logged_user&.admin
  end
end
