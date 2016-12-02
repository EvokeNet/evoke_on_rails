class MailValidator < ActionMailer::Base
    include ActiveModel::Model
    include ActiveModel::Validations
    
    attr_accessor :to, :from, :subject, :body
    
    # validates :from, presence: true
    # validates_format_of :from, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  	validates :from, presence: true, format: { with: VALID_EMAIL_REGEX }
    validates :to, presence: true
    validates :subject, presence: true
    validates :body, presence: true
    
    def deliver
        self.validate
        ActionMailer::Base.mail(from: self.from, to: self.to, subject: self.subject, body: self.body).deliver unless self.errors.any?
    end
    
end
