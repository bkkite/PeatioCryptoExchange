
module Admin
  module Deposits
    class Roto2Controller < ::Admin::Deposits::BaseController
      load_and_authorize_resource :class => '::Deposits::Roto2'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24 * 365)
        @roto2 = @roto2.includes(:member).
          where('created_at > ?', start_at).
          order('id DESC').page(params[:page]).per(20)
      end

      def update
        @roto2.accept! if @roto2.may_accept?
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
