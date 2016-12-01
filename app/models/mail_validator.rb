class MailValidator
    include ActiveModel::Model
    
    attr_accessor :to, :from, :subject, :body
    
    validates :from, presence: true
    validates :to, presence: true
    validates :subject, presence: true
    
    def deliver
        self.validate
        ActionMailer::Base.mail(from: self.from, to: self.to, subject: self.subject, body: self.body).deliver unless self.errors.any?
    end
    
end
