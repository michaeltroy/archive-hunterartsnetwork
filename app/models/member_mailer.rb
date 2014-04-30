class MemberMailer < ActionMailer::Base
  
  def new_member(member)
    email_base(member)
    @subject      += "Your account is ready!"
  end
  
  def send_forgotten_password(member)
    email_base(member)
    @subject      += "Forgotten or lost password" 
  end
  
  def updated_user_details(member)
    email_base(member)
    @subject      += "Updated user details" 
  end
  
  # Protected
  protected
  
  def email_base(member)
    @recipients   =  member.email
    @cc           = "archive <hello@engineactive.com>"
    @from         = "Hunter Arts Network <support@hunterartsnetwork.org>"
    @headers      = "Hunter Arts Network"
    @subject      = "Hunter Arts Network | "
    @sent_on      = Time.now
    @body["member"] = member
  end
  
end
