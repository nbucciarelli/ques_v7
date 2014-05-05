class QueMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_que_email(student)
    puts '*'*100
    puts student.inspect
    @student = student
    mail(to: student.email, subject: "You have joined the Que.")
  end
end
