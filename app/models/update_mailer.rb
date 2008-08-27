class UpdateMailer < ActionMailer::Base
  
  
  def new_update(update)
    email_base(update)
    @subject      += "Update"
  end
  
  # Protected
  protected
  
  def email_base(update)
    @recipients   =  @email
    @cc           = "archive <hello@engineactive.com>"
    @from         = "Hunter Arts Network <support@hunterartsnetwork.org>"
    @headers      = "Hunter Arts Network"
    @subject      = "Hunter Arts Network | "
    @sent_on      = Time.now
    @body["update"] = update
  end
end
