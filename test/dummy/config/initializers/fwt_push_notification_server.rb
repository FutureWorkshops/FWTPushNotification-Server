#development (sandbox)
FwtPushNotificationServer.config = {

	:api_key => 'YOUR-DELELOPMENT-KEY-HERE',
    :certificate => File.join(Rails.root, 'config', 'APNSDevelopment.pem'),
    :passphrase => 'PASSPHRASE',
    :gateway => 'gateway.sandbox.push.apple.com'

};

#production
# FwtPushNotificationServer.config = {

# 	  :api_key => 'YOUR-PRODUCTION-KEY-HERE',
#     :certificate => File.join(Rails.root, 'config', 'APNSProduction.pem'),
#     :passphrase => 'PASSPHRASE',
#     :gateway => 'gateway.push.apple.com'

# };