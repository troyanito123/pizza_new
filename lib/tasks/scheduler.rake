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
  reports.each do |report|
    day = report.day
    if day.today?
      report.day = day + 7
      if report.save
        ReportWeekJob.set(run_at: report.time).perform_later(report.email)
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
      report.day = day.next_month
      if report.save
        ReportMonthJob.set(run_at: report.time).perform_later(report.email)
      end
    end
  end
  puts "done."
end
