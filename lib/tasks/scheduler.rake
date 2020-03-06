desc "send daily reports"
task :send_report_daily => :environment do
  puts "Sending report..."
  reports = Report.on.daily
  reports.each do |report|
    time = report.time
    report.time = time + 86400
    if report.save
      ReportDayJob.set(wait_until: time).perform_later(report.email)
    end
  end
  puts "done."
end

desc "send weekly reports"
task :send_report_weekly => :environment do
  puts "Sending report..."
  reports = Report.on.weekly
  reports.each do |report|
    day = report.day
    if day.today?
      time = report.time
      report.day = day + 7
      report.time = time + 86400*7
      if report.save
        ReportWeekJob.set(wait_until: time).perform_later(report.email)
      end
    end
  end
  puts "done."
end

desc "send monthly reports"
task :send_report_monthly => :environment do
  puts "Sending report..."
  reports = Report.on.monthly
  reports.each do |report|
    day = report.day
    if day.today?
      time = report.time
      report.day = day.next_month
      report.time = time + 86400*30
      if report.save
        ReportMonthJob.set(wait_until: time).perform_later(report.email)
      end
    end
  end
  puts "done."
end

desc "send customs reports"
task :send_report_custom => :environment do
  puts "Sending report..."
  reports = Report.on.custom
  today = Time.new.strftime('%^A')
  reports.each do |report|
    days = report.days
    days.each do |day|
      day_report = day.code
      time = report.time
      report.time = time + 86400
      if (report.save && day_report == today )
        ReportCustomJob.set(wait_until: time).perform_later(report.email)
      end
    end
  end
  puts "done."
end