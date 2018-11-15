class WebhooksController < ApplicationController
	before_action :auth_anybody!
	skip_before_filter :verify_authenticity_token
	def tx
		if params[:type] == "transaction" && params[:hash].present?
			AMQPQueue.enqueue(:deposit_coin, txid: params[:hash], channel_key: "satoshi")
			render :json => { :status => "queued" }
		end
	end
	def roto2
		if params[:type] == "transaction" && params[:hash].present?
			AMQPQueue.enqueue(:deposit_coin, txid: params[:hash], channel_key: "roto2")
			render :json => { :status => "queued" }
		end
	end
end
