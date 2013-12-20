module FwtPushNotificationServer

	module Notifier

		class FwtPushNotificationServer::Notifier::GCM < Notifier::Base
      protected 
			def send_public_notifications(notification, device_tokens = [])        				

  				@device_tokens = device_tokens.is_a?(Array) ? device_tokens : [device_tokens]
				
  				@gcm = ::GCM.new(FwtPushNotificationServer.gcm_api_key)

  				@registration_ids = []
  				@payload = { :data => { :message => notification.message } }
  				@device_tokens.each do |device|
  					@registration_ids << device.token
  					if @registration_ids.count == 1000
  						send_batch
  					end
  				end
  				send_batch
  			end

			private
  			def send_batch
  				response = @gcm.send_notification(@registration_ids, @payload)
  				body = JSON.parse(response.fetch(:body, "{}"))
  				results = body.fetch("results", [])
  				results.each_with_index do |result, idx|
  					if result["error"]
  						@device_tokens[idx].update_attribute('is_valid', false)
  					end
  				end
  				@registration_ids = []
  			end

		end

	end

end