class ApplicationController < ActionController::Base
  def homepage
    render({ :template => "my_templates/homepage.html.erb" })
  end
  def process_text
    @user_text = params.fetch("content")

    qrcode = RQRCode::QRCode.new(@user_text)

    @svg = qrcode.as_svg

    render({ :template => "solutions/qr_for_text.html.erb" })
  end
  def process_url
    @user_url = params.fetch("page")

    qrcode = RQRCode::QRCode.new(@user_url)

    @svg = qrcode.as_svg

    render({ :template => "solutions/qr_for_url.html.erb" })
  end
  def process_wifi
    @network_name = params.fetch("ssid")

    @network_password = params.fetch("pw")

    text_to_encode = "WIFI:T:WPA;S:#{@network_name};P:#{@network_password};;"

    qrcode = RQRCode::QRCode.new(text_to_encode)

    @svg = qrcode.as_svg

    render({ :template => "solutions/qr_for_wifi.html.erb" })
  end

  def process_sms
    @phone_number = params.fetch("phone").gsub(/\s+/, "")

    @starter_message = params.fetch("message")

    text_to_encode = "SMSTO:#{@phone_number}:#{@starter_message}"

    qrcode = RQRCode::QRCode.new(text_to_encode)

    @svg = qrcode.as_svg

    render({ :template => "solutions/qr_for_sms.html.erb" })
  end
end
