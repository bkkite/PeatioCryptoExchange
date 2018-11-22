module Admin
  module Withdraws
    class Roto2sController < ::Admin::Withdraws::BaseController
      load_and_authorize_resource :class => '::Withdraws::Roto2'

      def index
        start_at = DateTime.now.ago(60 * 60 * 24)
        @one_roto2s = @roto2s.with_aasm_state(:accepted).order("id DESC")
        @all_roto2s = @roto2s.without_aasm_state(:accepted).where('created_at > ?', start_at).order("id DESC")
      end

      def show
      end

      def update
        @roto2.process!
        redirect_to :back, notice: t('.notice')
      end

      def destroy
        @roto2.reject!
        redirect_to :back, notice: t('.notice')
      end
    end
  end
end
