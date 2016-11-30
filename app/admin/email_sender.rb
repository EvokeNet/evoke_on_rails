ActiveAdmin.register_page "EmailSender" do
  content do
    puts params[:mail].inspect
    if (params[:mail]).present? 
      mail_params = params.require(:mail).permit(:from, :to, :subject, :body)
      @mail = MailValidator.new(mail_params)
    else
      @mail = MailValidator.new()
    end
    render partial: 'email_sender', :mail => @mail
  end
  
  page_action :send_email, method: :post do
    if (params[:mail]).present? 
      @mail = MailValidator.new do
        from "evokenettech@gmail.com"
      end
      #@mail.delivery_method :smtp, :address => "smtp.mailtrap.io", :port => 2525 , :domain => 'mailtrap.io', :user_name => '80f5f1aef4ae15', :password => '8db4cd615a4d6b', :authentication => :plain, :enable_starttls_auto => true, :ssl =>false
      @mail.to = params[:mail]['to']
      @mail.subject = params[:mail]['subject']
      @mail.body = params[:mail]['body']
      @mail.validate
      #@mail.deliver
      redirect_to admin_emailsender_path, notice: "Your email has been delivered" unless @mail.errors.any?
      @mail.errors.full_messages.each do |msg|
        flash[:error] = msg
      end
      render admin_emailsender_path, :mail => @mail
    end
  end

end