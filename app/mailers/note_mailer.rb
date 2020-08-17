class NoteMailer < ApplicationMailer
  default from: 'ransolo@me.com'

  def note_email
    @user = params[:user]
    @note = params[:note]
    @body = @note.body
    mail(to: @user.email, subject: @note.title)
  end
end
