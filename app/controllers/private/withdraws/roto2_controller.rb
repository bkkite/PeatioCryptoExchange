module Private
  module Withdraws
    class Roto2Controller < ::Private::Withdraws::BaseController
      include ::Withdraws::Withdrawable
    end
  end
end
