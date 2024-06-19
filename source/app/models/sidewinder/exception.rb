# frozen_string_literal: true

module Sidewinder
  class Exception < StandardError
    class LoginFailed  < Sidewinder::Exception; end
    class Unauthorized < Sidewinder::Exception; end
    class NotLogged    < Sidewinder::Exception; end
  end
end
