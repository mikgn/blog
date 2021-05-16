class AdminMailer < ApplicationMailer
  def send_statistics
    @posts = Post.order(comments_count: :desc).limit(10)
    email = Rails.application.secrets[:mailer][:admin_email]
    mail(
      from: 'statistics@myblog.com',
      to: email,
      subject: 'Popular Plog Posts'
    )
  end
end
