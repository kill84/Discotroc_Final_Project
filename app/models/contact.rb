class Contact
  attribute :name, validate: true
  attribute :email, validate: /\A[^@\s]+@[^@\s]+\z/i

  attribute :message, validate: true
  attribute :nickname, captcha: true

  # Declare the e-mail headers. It accepts anything the mail method
  # in ActionMailer accepts.
  def headers
    {
      subject: 'My Contact Form',
      to: 'hello@yopmail.com',
      from: "\"#{name}\" <#{email}>"
    }
  end
end
