class NoteMailer < ApplicationMailer
  default from: 'ransolo@me.com'

  def note_email
    @user = params[:user]
    @note = params[:note]
    @email = params[:send_to_email]
    @body = @note.body
    mail(to: @email, from: @user.email, subject: @note.title)
  end
end
