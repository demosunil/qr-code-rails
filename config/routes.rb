Rails.application.routes.draw do
  # Write your routes here. URLs to support:
  
  # /text 
  # /url
  # /wifi
  # /sms
  get("/text", {:controller => "application", :action => "process_text"})

  get("/url", {:controller => "application", :action => "process_url"})
  get("/wifi", {:controller => "application", :action => "process_wifi"})

  get("/sms", {:controller => "application", :action => "process_sms"})


  get("/", {:controller => "application", :action => "homepage"})


  # Solutions below.

  get("/solutions/text", {:controller => "solutions", :action => "text_qr"})

  get("/solutions/url", {:controller => "solutions", :action => "url_qr"})

  get("/solutions/wifi", {:controller => "solutions", :action => "wifi_qr"})

  get("/solutions/sms", {:controller => "solutions", :action => "sms_qr"})

end
