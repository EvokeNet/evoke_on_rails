ActiveAdmin.register_page "EmailSender" do
  content do
    @mail = Mail.new do
    end
    render partial: 'email_sender', :mail => @mail
  end
  
  page_action :send_email, method: :post do
    if (params[:mail]).present? 
      @mail = Mail.new do
        from "evokenettech@gmail.com"
      end
      @mail.delivery_method :smtp, :address => "smtp.mailtrap.io", :port => 2525 , :domain => 'mailtrap.io', :user_name => '80f5f1aef4ae15', :password => '8db4cd615a4d6b', :authentication => :plain, :enable_starttls_auto => true, :ssl =>false
      @mail.to = params[:mail]['to']
      @mail.subject = params[:mail]['subject']
      @mail.body = params[:mail]['body']
      @mail.deliver
      redirect_to admin_emailsender_path, notice: "Your email has been delivered"
    end
  end

end