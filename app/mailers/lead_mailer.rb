class LeadMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.lead_mailer.signup_confirmation.subject
  #
  def signup_confirmation(lead)
    @lead = lead

    mail to: "alloffices.nyc@gmail.com"
  end
end