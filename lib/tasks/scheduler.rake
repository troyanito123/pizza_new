desc "send daily reports"
task :send_report_daily => :environment do
  puts "Sending report..."
  reports = Report.on.daily
  reports.each do |report|
    ReportDayJob.set(run_at: report.time).perform_later(report.email)
  end
  puts "done."
end

desc "send weekly reports"
task :send_report_weekly => :environment do
  puts "Sending report..."
  reports = Report.on.weekly
  pizzas = Pizza.weekly
  reports.each do |report|
    Pizza.mailer.delay(run_at: report.time).send_report(pizzas, report.email)
  end
  puts "done."
end

desc "send monthly reports"
task :send_report_daily => :environment do
  puts "Sending report..."
  reports = Report.on.monthly
  pizzas = Pizza.monthly
  reports.each do |report|
    Pizza.mailer.delay(run_at: report.time).send_report(pizzas, report.email)
  end
  puts "done."
end

desc "test"
task :test1 => :environment do
  puts "Sending report..."

  Test1Job.set(wait: 1.minute).perform_later('BYE')

  puts "done."
end