class Notifications < ActionMailer::Base
  default from: "karl.augustine@isilon.com"

  def became_owner(step)
    @step = step
    @user = step.owner
    @candidate = step.candidate
    mail to: @user.email, subject: "[RHC] You now own #{@candidate}!"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.candidate_updated.subject
  #
  def candidate_updated
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
