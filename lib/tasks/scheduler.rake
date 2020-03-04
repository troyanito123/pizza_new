desc "Send report daily"
task :send_report_daily => :environment do
  puts "Sending report..."
  reports = Report.on.daily
  pizzas = Pizza.created_after(Time.new.midnight)
  reports.each do |report|
    # Pizza.mailer.delay(run_at: report.time).send_report(Pizzas.created_after(Time.new.midnight), report.email)
    PizzaMailer.send_report(pizzas, report.email).deliver
  end
  puts "done."
end

desc "esto envia reportes"
task :send_report_weekly => :environment do
  puts "Sending report..."
  reports = Report.on.weekly
  reports.each do |report|
    # Pizza.mailer.delay(run_at: report.time).send_report(Pizzas.week, report.email)
    # PizzaMailer.send_report(Pizza.created_after(Time.new.midnight), report.email).deliver
  end
  puts "done."
end

desc "esto envia reportes"
task :send_report_daily => :environment do
  puts "Sending report..."
  reports = Report.on.monthly
  reports.each do |report|
    # Pizza.mailer.delay(run_at: report.time).send_report(Pizzas.created_after(Time.new.midnight))
    PizzaMailer.send_report(Pizza.created_after(Time.new.midnight), report.email).deliver
  end
  puts "done."
end