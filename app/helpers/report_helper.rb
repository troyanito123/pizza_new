module ReportHelper
  def create_days(custom_days)
    res  = []
    custom_days.each do |day|
      d = Day.find_by(code: day)
      res << d
    end
    res
  end
end
