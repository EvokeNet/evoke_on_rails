ActiveAdmin.register_page "Email Sender" do
  content do
    @mail = MailValidator.new()
    render partial: 'email_sender', :mail => @mail
  end
  
  page_action :send_email, method: :get do
    redirect_to admin_emailsender_path
  end
  
  page_action :send_email, method: :post do
    if (params[:mail]).present? 
      mail_params = params.require(:mail).permit(:from, :to, :subject, :body)
      @mail = MailValidator.new(mail_params)
      @mail.from = "evokenettech@gmail.com"
      @mail.deliver
      redirect_to admin_emailsender_path, notice: "Your email has been delivered" and return unless @mail.errors.any? 
      @mail.errors.full_messages.each do |msg|
        flash[:error] = msg
      end
    end
    render action: 'index', :mail => @mail, :layout => false
  end

end