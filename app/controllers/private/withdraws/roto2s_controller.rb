module Private
  module Withdraws
    class Roto2sController < ::Private::Withdraws::BaseController
      include ::Withdraws::Withdrawable
    end
  end
end
