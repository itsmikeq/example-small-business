module EmailHelper
  def line_break(s)
    s.gsub("\n", "<br/>")
  rescue
    nil
  end
end