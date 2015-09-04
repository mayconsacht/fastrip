class Contact < MailForm::Base
  attribute :name,    :validate => true
  attribute :email,   :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
  attribute :phone
  attribute :message

  def headers
    {
      :subject => "Contato de #{name} (#{email}) no site FASTRIP",
      :to => "maycon.sacht@gmail.com",
      :from => %("#{name}" <#{email}>),
      :'reply-to' => "#{email}"
    }
  end

end