class MailValidator
    include ActiveModel::Model
    
    attr_accessor :to, :from, :subject, :body
    
    validates :from, presence: true
    validates :to, presence: true
    validates :subject, presence: true
end
