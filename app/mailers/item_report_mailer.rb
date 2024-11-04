class ItemReportMailer < ApplicationMailer
  default from: 'equipo.tudestino@gmail.com'

  def new_report_email(item_report)
    @item_report = item_report
    mail(
      to: 'florezs043@gmail.com',
      subject: 'New Item Report Created'
    )
  end  
end
